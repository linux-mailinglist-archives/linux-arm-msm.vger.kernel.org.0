Return-Path: <linux-arm-msm+bounces-96645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKAZDIIgsGmCgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:45:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB0250B7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB17531AEBC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D369F2FE042;
	Tue, 10 Mar 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqZAdISF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqIJT+N2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755D32BF52
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147349; cv=none; b=JveLl6s5MgfIMhn1vk9M1MPIa2dQ/Yw2xLU84y5wo5YFR/TkesxBjpyHunvTTb8L4NTnQyfUY1RxinEqxZ4JDTFpdl3436p/Ey1VuC4M0UoeY9gj28GSjsL7n1q2vczBy8BCUIbp33KQh9RPZybT7FhfFuDseIWh44n8u1oXE5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147349; c=relaxed/simple;
	bh=r9wxNfT8VPmFJAxrTGhP1ZYFs8zke1vHa8U2i0o0B5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBQCr/EDXX0q1sBy4Jx+iqryTpram0R2Hcc93zMJE618vPGTi2NR+mdYVWnLj8f1sa8Q13vHmDOYtWDXEXfLTYF4WU1DHn21IM9TZ9n65iUFtzAwgP+K5ZsX2L8S+SrRfPXaLmI6nv5nPEAMMyZC9qpfiGHNVBl+Chrwwtrmk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqZAdISF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqIJT+N2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACbDVM3297898
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFEMryqsqS4BwsL/EHCx9GOiHZFrudMq4w8Nk/d2XKk=; b=RqZAdISF0a11R/mF
	heqBx/UMlW6pDvngv2hNqwWH3jmyEroU+S7edzxVseL4nB1yw+dpSpISk2kkONF0
	ZDChrZIuVz3/jzVrTdOsuEamVJt4rO1u/82enVXLeDs/GM5tvVoyMPUP07d2UhEH
	OGYBne8QmzYlo+sC2uyKbXKterhSr5Gb7O1cw56RE1TILyb0kMzqimJxjf+TkRt8
	y3vpJeyoBnETOG/RGoByLlvOEs7GUkwfiwN6IvdtOECupFcVuuUY1DaOoLjcE5ha
	C9R/HJSn48cmmxtHsHaUgqx/CiKwqSHMfWh9xRmXDR6CYX+ht0mu/sWRLk+mRIo2
	QzhHvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrx2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:55:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a012f8ab7so56126976d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147347; x=1773752147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFEMryqsqS4BwsL/EHCx9GOiHZFrudMq4w8Nk/d2XKk=;
        b=IqIJT+N27HNAaa1/vvywqjmXCB/Sq90WK+3Y2V3Zl469uRxzuojTT344HH37TxsrDn
         FOKNOHnZFiEvjpY+/xTgkDgH6SdrFpRg4ei8niHp08/tuYRMXB6hRMI9lm6ifnGZBhRf
         O2MKnoHtqtzkgzi2A6cMuL6d0LUIG5Oi6eIBryPlSeHDa2ISFAfjX5cRuZnY1DSjmRuc
         tGv0Pq3xe4nr1lf6oehjLy7fNF3Rkd5Bxwyq9bNXMx/YIMU7rfA+Pqpoz1nTRhQNoQ8k
         qAXuUuqAViEsmr26izXIkZjoK3KRsVma5GUQwkUjjOhKOAfXG4FUI99a9qYDrQJ+x+hv
         78Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147347; x=1773752147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFEMryqsqS4BwsL/EHCx9GOiHZFrudMq4w8Nk/d2XKk=;
        b=JCprMx4xS4spFY0BAVddNLzTAZUfGopl++3o/MOTExOiWZbrjkgvhymt+NhPSwI1Rv
         XBOQhADAkTD98lHOJBPSt5ara3LNOZvZrOYWazcer4KC1PQy2+Pw1zDdGuYLSMCgrowl
         bW+aPa+wWvRUQ2m1wx3gwlOuX8ORJMvVvOGdJMf/EMmRUnoMdkv9N+CufsQ7hLRVa4+8
         xg5a9HcIiSwvVN4MWh9ZhpESRiAVC5vPTNt9HcUCdqwBfCuoYPMMLWG4loibqEeQXxHN
         R2KJv4pGbh8injyZRhvpgQL4yP+eXlFvpfuEabloqUMLhF4takQWmAyJWpW+0xVNBX0F
         prEQ==
X-Gm-Message-State: AOJu0Yz4q1l79qhWjt6rNdQAcTYS6WXDdvV8Rx4cjFpdkDnZeSgsTCNH
	4MzX7XCgNt1SUotG/s1ZdrJ9UMhuHa8RDaWuFCLCWPoiFYoz/5RBUlP/xghBk9CIzE08zb60Q3z
	+9KdBN9GVF9ucR9hDqHgeiJS6tS3//C66r9VyEt3qm1YDvVN6dLQz/vGGwE8LNYIDg5Lb
X-Gm-Gg: ATEYQzy46in7s7ORZpYakNlgiHC9PBhkVA6S0QOG6iqaesaGaUNUpXRNwJS0mr3taha
	BbXi0kRy/yWJW6bH5RPQlMOw31LKS31xKyMNEKsbWrMLy+ObYJ2mFwSzey0Z8jYj0QiDUTg1XQj
	cTBB8JCHQkkf6copAUkkxxLx+11XpVCt8/11NQQ+PJZSzBiqp+4nRhPs2g+YAKTGehPzvkHW4LR
	QkQTFR49tWl8UPwJwUXgNvnT3CrOPY+Yiohw7MITMuB2hjZBQvMb3N2IwJ3LimKAyktD+GPlJP8
	DY1dL2oPpE/6MDjL4UbwtVNZu6ZWet98FBVylG6wixln3BILEY4ojmD3uywoW2vIKGccPPDNXa+
	vlZdOfJo7Hzd3CLqalHfDCsfLXlEwbtPmd6w5xacPNg2SGkInCqumeOrcYBjT8lULrYVW1pbICu
	sNnXU=
X-Received: by 2002:a05:6214:6116:b0:89a:5323:8602 with SMTP id 6a1803df08f44-89a53238ca5mr47779566d6.5.1773147346983;
        Tue, 10 Mar 2026 05:55:46 -0700 (PDT)
X-Received: by 2002:a05:6214:6116:b0:89a:5323:8602 with SMTP id 6a1803df08f44-89a53238ca5mr47779356d6.5.1773147346614;
        Tue, 10 Mar 2026 05:55:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9439cffe9esm434073766b.43.2026.03.10.05.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:55:45 -0700 (PDT)
Message-ID: <e17d100d-fab7-4819-8541-5e3154faca24@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] soc: qcom: ubwc: use fixed values for UBWC swizzle
 for UBWC < 4.0
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-22-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-22-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b014d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s2HaDkfhFSauWBmy1SQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: jBf2ES4OZKJXu3n4uuq7tf2d6oY0edYz
X-Proofpoint-GUID: jBf2ES4OZKJXu3n4uuq7tf2d6oY0edYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX9W9bpd1kyehG
 ascIwiLS7FNeazb753EEsxoc5wSubt6ait/nWD0taVu9+EnejK8XkQudY31cVzR3/xA70Z+b9T+
 wA66iL9In+wCncGyYB5ax2ZQwmCc+E+4vfFYHaehHu+OwL0V40lpFflcWU0GykkhA6Xrt4vG9cW
 T4SJg43p9fLn5HXw4lmYFXFNJLLjNnfSfwyJWTKSao+IOPH6BWql/1/edD7LoZVSt3VgKQBeZ+D
 QrZUk76xawEjDcoe1fxQ//ieFje7pj6pyEODRVBdZ4BNVlO3rlDdhGZaPC1bAiB+knIuXKk2+ii
 dqYQGPyloHYAZkRowIt8OpdcKGCUV3IFH9FXQWB9r/Y0AcDzPM2Dpnf7uq7YJc+1bT0LFBif8Jk
 Wgbl0fsv3quY90Q01b4inIPQ2DOQgwCb8tJGpjLztLiAJ1+OdPZJf8eWanIaOjTxGmJCGlQ1BX1
 IKFrPZ7MUHpDBltLmkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100112
X-Rspamd-Queue-Id: B0DB0250B7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96645-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
> drivers now use the qcom_ubwc_swizzle() helper, move those values to the
> helper, leaving UBWC 4.0+ intact for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

