Return-Path: <linux-arm-msm+bounces-108999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHW1LtjTDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:43:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE05A28D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFC4A3017453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2228C3242B8;
	Thu, 21 May 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkGoB+/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFAeVCJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E42E378D9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356629; cv=none; b=kfGlfGswptGrziwLVzVqJDt/bBFqRsRaxQklJk4KI2cRZ4hLfBHSbmDbPPw+6bEEWXLD5+kCLb6Qe5PFH+l53ZPtWfkAJ2b9VD5ZMOA2mjisze2gXBjGp91oYXaezYdoaobtGK3jRFE0rPpc8wiQjc9zkTl8SVqd7xUGI/OlGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356629; c=relaxed/simple;
	bh=3qn5s+dtiX4sfsgJM10WySpwmJvgBdAU8qC72m4EYkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEhUBKnSGH3Qk52K2K5fU5nEcl02M7RnzMiOyTzdG+dY3NYGHiql+hqhYdq3Sx9bhRJPOq73Cs8dVzysQbgFzPaTxXcUPa5KvjAc2/GgehC+cbrO6kfNzMeg8Fm1I3+9XDYaBsR1SJ4+wG7ShXlFQbW4lkmDfbFfshs25t7Clfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkGoB+/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFAeVCJl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A6Iv3452608
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=; b=HkGoB+/LhXTFm1th
	UJ7ZAhEZdLQhzQM/sBK1KCihGwEl00WEPBbpUAxZNLknCpvugrv/tEcnusX2zrE2
	GMRhjsEEUYfpM82qgvcmm6IvwhYUXjCj4yb6fU71smD3q2Z0sJWp2uxCWewLLfzs
	JSz0HkRcrHlYr3M18+820ySJ1axXxsic6/HblwRSKi8pOszEAWh/hxR8iRvUGoxd
	/j4keSUb7mXX0kAp+MFHDl5aEu9RWy8oTs8cs/O1ZEGtmxHQLsZc5NOaZktTpxyc
	68736GR2TxsOh56bmgkgTB1xik8XNEBjXwEu14MZKtlVxiia7JPbn/T6bwbVnOKp
	7SHVxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h86aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:43:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso32143091cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356626; x=1779961426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=;
        b=ZFAeVCJl7uG3xmxaW6R63BL6104ONZ4h1raBArK/jfssnZoSEuDxU1UF4tP2c2uj0d
         QjYk6RigLXXfS75UIPM/SBtfTzW+9JkiFqIhY45XSYL8UYfPLS/J9Rl6kVAHBta3VSlM
         oaiYhqhgNOEZG3lG85t7YPKj/P4U6f6TeCNqPu58H+uBLySRm5UjLUBnXhBlrwZr0Cz6
         rxBf3JIZueS+0NogvNhUSisKjD6RmFl07lhjAbvS17k6hrytTrU8VOykjrJxebYQp4Xn
         qL5QmieClf52Y/MiMveRbFkPa7KJkJHD+3UNirdYTU8CkoIem/6mWN2HTstZ/mVk2ltH
         P6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356626; x=1779961426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=;
        b=mRGMK1qDDajz2vFryom8sq9U3MmAamP96zeyP5HmYozKv2U1GCh7tuKUWQ3xjzzYYU
         +TWwHHX1qaNS7rLNr1M4C2fG5Px8S7HxU15lNOOqz4rOy5wmbR9vGXFcTtjW7MdwVwvi
         YVI6N3casdRFW7FhdLPuN4YJIOyQG/rlKLyYr4YlYRNm74i6dPM+1rbIeVWF4z4X81AK
         Q+OzDp3B/QYCvOEH9IPtQgcuYMmE+ZO9Ydr6eKm0arz0uh2NbVhMvVzo83UJ9tm0xOL+
         zgcocvV1FakTYhtxpYQ7kQeSS37cPWyY8BB/keND/F8KgWNKsHojf1NUw6BJkNR7Zw/v
         3/3A==
X-Gm-Message-State: AOJu0YyDrM/ZPD+4bcS6P3tZ+3hlvaKhCTgmhYOzpME0UDCVD/zaAzfn
	vVOdkfg2vDgCNzfEzubK+lxDXphSy0T8bj+4HM4ZvMOTh+m5cfjQ/wRKlz6LkNsI669HzqtpvUm
	DBlGDgLkma29KQE15iY8X/Ys3fTqtxwsHzQXe30nECkpVVx30kG80eNTO4GS0Mh3oe4nH
X-Gm-Gg: Acq92OFilXZ8btMi1E8w+7INxqk/uQCl5c8tyCEIV5nJD6sx8IXfEdXudZDD90fVsKQ
	QKdPfZzqWHANdmXfA+46t6Dj8tsAMaK+AhiK6o+ChggHTkCK8jAC4uxBzs5/x3er6BxnQC+gIZX
	K0FCzRsDftpi/1s6hiFujzUCyGM2JiMs7jZiUJ5d7damMx/BLaKPgsW2gFggSght9cJ8fK+QfQd
	YHDcvLxmXAmiUopZH+UDU1EXbbt5Ss4kF5ZKi88txOPfhf74S32OLRG3446nmQYI7PkiYW1y/Vw
	P/YAV+YpGLEmAetcuvVBVJJFDiS6+HN/5INdecJcG9D61rnAMnVSrtkdxsH8U+3qQxJOi5m04y+
	VL2TDp0OmgbCl79DEQoxigw0oRWGwHaSurKDPNeQiYhjCSZRnrb1Vd4IBV1UlsiRIDqlfLjilQV
	Fqv30=
X-Received: by 2002:ac8:5ccd:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-516c56d0badmr18732281cf.8.1779356625847;
        Thu, 21 May 2026 02:43:45 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-516c56d0badmr18732051cf.8.1779356625303;
        Thu, 21 May 2026 02:43:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79e04sm23605166b.21.2026.05.21.02.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:43:44 -0700 (PDT)
Message-ID: <7ddd43eb-855f-435f-8f8c-5d1bf10bc31b@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:43:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260515-interconnect-qcom-clean-arm64-v2-3-adeebc73596d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-3-adeebc73596d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Nawk96nsDo39QLX0HlUbZ08DMCmcsLUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX6amXxG6j0MSN
 e8kkWpa05dH9ALPmC5UCpia3dLHDaKoeiNBThZuwxzIu5MDnABe7NyaHhOGt/r0e1+Mc+IBggcs
 1+bnyfcoQq23lMZPKZBBaBobuHo75dkCvHBT40+2MShiA4/vSaXtC4BjR1cHTD5COyK0CB/tQGM
 lPapi1M4wLsd8UiiWkiVR9IIapP9efWa1KWN3KnpmAPik920Wz6hiZkaE7u42fJ9i/E7jPoBxgl
 fcuNN5R88N0dx+bV2vGPoRoNj4QNRULmo/N5hIR//7O0ZJpyzd0OtHkUPE0Z1g900O8dYbgRu4m
 CcqdsCio8TYvM0uIBiJOMzzszu2BAvT2V/4Kulq8Mjh1KfCbj6+fyl+oOMINmNRrvvN9WHxDGrH
 +XffBuAZ24KgzEDQgqiGu7YZvWrjrNu+XQBulMJSpT/YndV6AACNlSqOT0X6dP7UybaHUtsGSks
 8IFZj+WJDMPHSpcCyeA==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0ed3d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N0nv3qFBaOOCOp0HD7oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Nawk96nsDo39QLX0HlUbZ08DMCmcsLUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108999-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EBE05A28D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 2:11 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

