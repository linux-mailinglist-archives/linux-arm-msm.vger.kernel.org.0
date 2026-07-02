Return-Path: <linux-arm-msm+bounces-115839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lLnDM1MLRmr8IAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:55:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365B6F3F0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q1aSo5Fj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TNQ+Itdf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C524A30091CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A2937E2EC;
	Thu,  2 Jul 2026 06:53:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3838C2DE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:53:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975218; cv=none; b=U8KUPbPuWVWrmW69w0zju9tKw3bP4ju6bHnL9d+1Ew8jubsdyY0AZ/h2yEC+tVjbb6lXbsl/YRv6+8NSiYeapDhAQC6NQKdUy+JezJzbgJPDNyQpPthrfR/7gEqC3IZfQGaUswnA0wYpkN5tTVXmfGx8lRG167JWP2XPJV1Eq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975218; c=relaxed/simple;
	bh=+4b3w6JmV1B0LZJw52j1qed3WNOp/NfO4qp3OK/aatM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twa2UIGKTmmq8M7IATNpTE6Fc/h1GSYV3S5RwYYyj0OFG6jcy4bNPqZOeAutFx4yHvRZ265BLTDP1j/ejixBu5G6YQJMRrCEXMEfxSYpZHifK+N6EKWKjaC3IMs2gyauzsq5Qc6JvGiPmtGnrPuEtsmGO5jmYTeMKwO1LdynXX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1aSo5Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNQ+Itdf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iBKB3591072
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=; b=Q1aSo5FjWCvGe4xm
	t/kmK2wpQ4rvcpgGyWYAh6HtsmUmb+YgJ/CrV4dsNOyzFTM0UGngY/ztD3R6lBfO
	tQ6IMttWxrdEi9/qGIB34BDYQyFVVT+obQguohRSyVLpVy1L1NkZ+H+89nRzGUdE
	r2ZQuFlgrK0xHIUoapaL27LxMX4F8KRytIYl7O0HDnMqc/P8IYY90It7eA+ZFS/l
	T86FauypaGcnnJEgKqA7EmDuD1BxBS6OBpDT/SQla2oSRg/I6TQ52enDvzcUQ/P5
	Ixh9Tk2irHT3BIneZ20/gjAr/2Ra/CKx0BuPFND+cJmp0iLJhMers92901A99gR9
	vZ2wNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8dfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:53:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso1572831a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782975216; x=1783580016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=;
        b=TNQ+Itdfn3OB51EKHyfuW0JaXYuB7tfapNsW2WD7X5Tc9MmlQ5WmnGtFAyHnEXXUWb
         nXkx1u3NwzatgYfYkPNwg+EpyW63LgPoQHs+acZX9Wyy0AzpXeLSni3zgNCxLr3IRBzR
         JM9Yohx76QCM9qW+3szIfSSoHq2edegqwHpXYmX4UMvAjj26wYq4GMJXNSVv7v+zsJfz
         8LlfjzeeT64MBTN/MtWzcr9Mya3kmkYZvwCEhaZb6okDPcLOusPWE/UKNGnCVoTdEonA
         lZNXXHH/DDgi0Xmg/BZKUwtQdmCICy0mfYNzJrshiqQfD96gXWunQzgtgAHCCerWI6Ba
         C79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782975216; x=1783580016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHip0Kz7buAzWxIlIF8kUD1bXgXidWDoAhK1k+rP8l0=;
        b=fhxguKK466JCSkm5UpSA/sKDRaRgJVgeVqCTpyVWOW6zPaSCzfWgGwUZp2nWsZSWbB
         cDHURXto/sKVqOdmrv62yv5hdRPRMoiMsHHzUKzuEPnFa/q3uXFjrOJNNbdLwXLiaOW/
         BHCaX3JmtDh6zyyWX55RSSsk2R3d21jcFxsvi7xb3E7zxY3yH0Vn09ZirgeoC3eYZdPV
         xZjDRAsfE6dMuUHv8u20xeuX0+Jo6+2Z1uAtdk1NCl1nB9sEOHLTh0q0npHxuTNbYolv
         Uv2OMsItUA4rZk38RpZUTGSdyoQVDfPMkeU7xRY46z31EX348NkvAMX0FBDS/h3Go2Jy
         5dBQ==
X-Gm-Message-State: AOJu0YztJd2c1S+YSTBaWL5clfxB56YWUWQ94MTgweSQU2aBiMp42R20
	gFzIbTslW03eGxJnKqLGMsfPW4iU38TY8rW9qFzXnVlMzmk1oNIZIVpDuoIci4lNhxNv1fohafS
	MW+B/msz04KvLJppDZPQCVQ3YNa+zBVhczh2zbrz4+QsBCVgghhn5t84OGsDvHKceuUbeGLihEG
	US
X-Gm-Gg: AfdE7ckoIA+PRf8hBUJfQK1zQ9fT+3oRUJx0yy1WZU67fnV+rfloaxvryPeJeiwx0Qi
	vxzK7LopZLDOoxB3yV109tyveNWqxhXODX/n6RtmoNS3GhDhCRe1dFRona0nPw5dgR+i8r1ycLY
	xfTYPsPOeSRbTGXSR8bOVL1fbskk58eapmHwm991V6Nq4j6k0vb8hGNKWysFSoGnV89MZtk8I03
	TN0Co5CGluU1Hpp8+34nJ5cpxLMjDgnCcqMGIKEgVRE1y+0cCDGziv5Skv599W0PfUcPDq7GdXH
	kblCV3IANM5Ntf05+q06sqwlVaK+/uGpwoPic3jmCrVm+gQ93SnsB9LhMfbt+wqrCtDXfwKEnhr
	lnsI0pQBYgfHJ5wEvYD7Mop1DdZfxP6qDC9Dkkfxy
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id 98e67ed59e1d1-380baa6b497mr3981923a91.18.1782975216279;
        Wed, 01 Jul 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id 98e67ed59e1d1-380baa6b497mr3981881a91.18.1782975215737;
        Wed, 01 Jul 2026 23:53:35 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e1608b23sm551730a91.9.2026.07.01.23.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 23:53:35 -0700 (PDT)
Message-ID: <08ed6b4d-5549-4aae-9967-1365db0e3aa2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:22:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
 <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
 <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <b43691aa-6d1e-4df0-9d1a-cd5c4b3e3dff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfX856D8cSTnKqT
 Pxoxgho1FudqDbLW39fPyJ6qRJk3B3AP4f3eEKhlA/yiwCKrv7QVdDEIfGnCm+bqAm+4m8CyqVN
 rOqQhK4sGi5wmmQitbCgVcLR5iKYERgF3Li3Hu3hiBl+V+A99xtNVoJ2EOs1gqYRFOcqc5x92/n
 8OR+0M9s2nlRidgWTLaOWGkQJP2tlbADLw/VfcqC7q4bM6kZwq3AhaS1AVumlv0NEQQPiRjuR1T
 CV7ZnZUGAZWytV8TCo0WztY/HtYrDVIVyveyhEl3WI6K1S2lYAReajKkhAGMq9dIm5LQ7mX4ipp
 0i2tuUO5KZ1VQYc8Hp3jnW6jkhClNOu9lu8m/NJtZVAp3YoJBPyFVKyjwu2Z+BzQH/7umQ7fYip
 yt9JLoaIhb1I9hxRAbIgwknX02TIfPPXjZkN+lSdpHgJN0YNwMjJCRa43DSlTAAuLbjif4CRc1A
 2emafrpIf2On0iZEnbw==
X-Proofpoint-ORIG-GUID: gkRvNrryKZwGr8mJe9uVcFIf5zwGtoEI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2OSBTYWx0ZWRfXxCfCH/Khzjtz
 ouH00hvsj6jPm2k2+2bYeDTEcf2NwWN8uNrxhWCOpygeAAJLsm4Sqgugg6YR60P1LqjJORqvEbS
 9ZRhQlw6vygQIPi0y8IL5iYkmPa/BuQ=
X-Proofpoint-GUID: gkRvNrryKZwGr8mJe9uVcFIf5zwGtoEI
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a460af1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nutul9sAWFEbEiaF5vMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115839-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9365B6F3F0F



On 7/1/2026 5:07 PM, Konrad Dybcio wrote:
> On 6/30/26 6:56 PM, Monish Chunara wrote:
>> Add support for SD card on Shikra SoC and enable the required pinctrl
>> configurations.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		sdhc_2: mmc@4784000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0x0 0x4784000 0x0 0x1000>;
> 
> Please pad the address part of reg to 8 hex digits with leading
> zeroes, like all the other nodes
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

ACK, Thanks. Will rectify in v3.

Regards,
Monish

