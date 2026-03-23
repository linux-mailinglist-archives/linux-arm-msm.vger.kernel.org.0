Return-Path: <linux-arm-msm+bounces-99212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eARbBZsgwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:14:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD542F1011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F79330DBAF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7E8395275;
	Mon, 23 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8EQxF/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5nDWRqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B779392828
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263722; cv=none; b=PwdCZC4cRApYITEDjD/tFuB4MFXoLbQAmDoNV2GUHpSONgLgd1CzvVI3XzPBoO7Dwr3WO0jwf5V/KE1TyzTkD2ilQ1YKPiQTLzpedDMHRfeQf3kX6RuDTnujAbBP/ArBLbq1O+JPmmjBtPDDA+lzdcwO0zsJIvo2tKrNR84x2A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263722; c=relaxed/simple;
	bh=Qf/SN4zw2xWU8ye0fNf7azjg6g0yfcgHYpQ+XwHTqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLfDSNeENj1Cp+e/0MbdydL3UJtGN4iwpJlItSgWf6K8JHuvr69qZUlYtPtStr4N+HfeD5P1CS3kIHp9cKOf85W5EWB48aJd5ivyDrv7ozNcEk+VM4pfLu8rNbL8/N4I1JEnSqTLtHsA/wkrdGAyEEyyrA47WqbEBAurIRVEEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8EQxF/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5nDWRqC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tWj41627093
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=; b=Q8EQxF/q2qBn/1+7
	VhjIRX7UMnc+FO1L4p+Bn4FV0B7xwfwPs28PCP8u5tCT3iGdzqIZzleFXAnMb+MU
	O/gV3Vf47lz4amtpZ8+9qgf6jIM6Z2VtQgd0GEKW1o74XzeDXOGQMzbbCs0hqzn2
	moX7hBbt2hRaR1KrqklgeOueVJgmwFjrdT7l6WcZdIOJarKKltNzumekZIN+eJpg
	C7hDElY9W0Prq/FXy3qaNtW1E4QwAQ2ppNNs0O4c2L3wpX2hKWFlpiHov91ne0aV
	s8aTcRqmIokZ2srBDO/9Ai22t9jpO93cwS1TkfPjDPrhYJQL7hpxDAkcJqleGksy
	wPZSFg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:02:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cdc810ab9so467909e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263719; x=1774868519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=J5nDWRqCAdNl5Pf0SofklmEu/l52i9jhA/MOJoBlIGyrAY0WQBtYY3/jT0Kslim/Bj
         aR0wv3S7XrSBvXYA1EaRUbizdixIX+6BMlTpbBPtbeYJwKPK6wqVM0XqCdZQbxJw+T/k
         mp6Tm+WHR4BgpaI65n2+JckZBWhdBb16iwK+Gg7OWnRNabls/m4Fn2r+wISDoz9dFbiH
         y8ldK9uY7hLro5hzGXSiZ0H/zBLk7cyWq5+dZ67jaj1b5tvFatUC3ChOeOyeViRqBUfI
         w060ZwIJvpMiFxgDCE1xbk05LLYs+eWciKGEhTpFk+0CUrJNjcEUcx6W9RG7BOjAHhm1
         aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263719; x=1774868519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=ppJjP5Pv7Qc6TRsYOOJe4GHFO4+FVoWSKG3apMzPPgXjCDp2RcWMZCIj8ZzZkJFRj7
         vl6AjQv71aeBKOkKq9pE0uVxts7CLx9KJphs6z5TFDcOfV91+KZsoPDWMoGuqOU42tD/
         4r43Oc5Cqdw9P9kMjWE9y0LSfo/qwPMv9GldHdlnXvqfa+rt46b1qiGJ1u5KW/uGV8nm
         q9skKFwEoD0efr+iKvjwizBtSsVMA8KahPHZCTfSLhrj2eqy7jBBrS9XgQIPxyXD25wm
         pyDdrviba1TY7KmHle0AQwo3q/lauXuww9iiX2Ql1KQ1SMSTiJRF6yYG9I4z0SeI47Rm
         Nbsw==
X-Gm-Message-State: AOJu0Yzcxhq42Tqs04vxIq045LLPlAOvp64S37beEfYCX+ivo61IZ29w
	I8PIB+XnKibrU38ii/6/T7zD6Ds/xCj9cl6NMrAOuewVtaa7cIGxKehZEWfMbjBeRBX98Uor4Xe
	hWG01wuXS5t8o9vNO/PakHzFqptKVdb97LvwjTXBkVBvjt6dD7GGyz+F7wTnzifustIGR
X-Gm-Gg: ATEYQzx5lE4TqvpxKTIg/LYs/4bUvd2o09U9LrLbO8Rqmrf38G1FgsMTR6kMz5wty6Z
	c0vEbyjoQrJFqdpBuf95fgDsXmfPeqFMgjOSNDI3XG8/cgjorTFRLvKxKwemQPgq2ZL2fC9gSXR
	ZqLjOv2Z0cZ7ezbUJ3eIzKEPKISDH/uWdS0XSnoZEhwJytyHAzMeOl5cFe4j6Sde5XdsGIX2JXV
	tMraWWLZgUpOR05897yN4i99SbsG699UtHDxk0vE8iitbL1tUPXreGhEdx7SuDMMggFAiucOqkC
	rkPouA/75TSZ+7xa2+VemATvKDuwV3O6kyuCkjnsUwthptlAaHYl7SD2rgnRl2OjpH4YgNRiZPW
	HWMgSDWSQAt62bYMElOOrKHEe1yDbJ+VFTLGVon2wGp/p7nSD/qck1EXtQS/Qz3+SzF+m7VwLTg
	Iht7w=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2186002e0c.3.1774263719476;
        Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2185959e0c.3.1774263718977;
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm473308566b.38.2026.03.23.04.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Message-ID: <e5a8c3d0-7f7f-420f-a5fa-cb177d321112@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c11da8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5GD08sD1clYvvWNuh_EA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: hzSUdkw1tNrI5ophMtxocOpxom65mluG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX+MiIRHhpv+hl
 RM5ycXyu0+SDp5kyMR+BLgNrjeRyjby949BCNhUEJLgakw1i1wYrWS5tB0N+SLUh+O+NCOsR6K6
 GAiZXXdqb8OGjey9CAIzglQUwRl8RDB66hVKNmh77LRTJfr7nMiMwhbpPdnDwMe0dFWCDTFauuq
 k+9HpRCXIrn1ENRHOLWHUEvqeP39tfTZHt+cKe8crF342s1QvzRzlGYcvRGzi1KQ4zEJ1IGJu8m
 Q5XbXwVr9MueKWNcu+v2+OCPVThQfPw2Z2nTMTmOuhFZyQL98HKcdHNLYDChu7dKDJMhHAKWGv1
 Hghs7lTrmSNPLmPRZDxo4/d6QmrF6qL6Gr7Bqek1Mo0kmxdmYbbKPR177mFA6zgLYjehbmeHXEF
 PoxSdkTV9AYzfhLTq9jp5akvly1jlhkvE2B01DQQ6rbhIMNVDRiJcpZf5mkyMahjvGfxP7DG98T
 NlhXnG195x7VeMofEQg==
X-Proofpoint-ORIG-GUID: hzSUdkw1tNrI5ophMtxocOpxom65mluG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99212-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BD542F1011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
> The qcom,sm4250-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks.  The SoC is derivative of SM6115
> (or vice versa), so the interrupts part is incorrectly placed and should
> be same as for SM6115.

They're the same SoC with a different speedbin fuse value for the CPU/GPU,
I'd say drop this binding altogether

Konrad

