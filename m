Return-Path: <linux-arm-msm+bounces-92408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGMWNqTMimndNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:13:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD81174C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBD093037C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009272EAD10;
	Tue, 10 Feb 2026 06:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U546m5ch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0Cenv+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4334303C97
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704020; cv=none; b=ImsqIogqRPfb6JU1Amb8N6V6Wb3cCVVPzxuvJtaIda/2pPRcELc06hez7/+anbaiZslxVMwxJWUZ9AVIYAaXzToKYUHlG9fLYq/nmqm+pk0hmrQ99gut/CltgRIUPlVm69hfqj03+2UMzEtPSjLJSXndrJ6gQruC/kCkXgC64wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704020; c=relaxed/simple;
	bh=YF5en3n9odqMj2GJrED6IaYivg9dsXuN8Q+2nkXBYeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pog8Pu6D1gNBzAPr0kp044ifqPSsbwoVms8GUvIyzK8IaKvej44zmrjhCtxNvdQ+keI8KT7ZF5+U4pvjj5FdYul16yWEaFZU4hNfwCghtOaHYLTUtA6qLAwEJvBUIwW2Jb8UuA/vcCFocDPXrr12AT3LJax9O+tzq9Dgf4PlgL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U546m5ch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0Cenv+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3cWWH1172349
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdyNRRqdxDJUzqcs0bjYblKR/wx3iWD+303Ic0lmswc=; b=U546m5chsQE+MCMQ
	BhvIP0koiq6bUoygB25vRcmj3fApe4ugUNRktPbocht1CEKJIWcf8pgm8A0VTtWD
	11xwY7AtsEQz9aXyuFXP1D74moggOtx4EKp/6Z9fZT+FHfttqqMU+4Jx+7MiCrEd
	KDgcXzQnn4BzAdvH9iFyYlIinsLc3ldUv1arQMT5QaPAVOr83ys9c51uzUxmaCP0
	v5LSmeOi7KMr1iZhGLceS/oiN+egve11kFiO9guBa+MBVSyUYdFEKZPsXiZO7wht
	XeSghakLwQOdaLsqN3Np4GIl7PSN8g1enA2303OHyWMGBiM6iFFWv29nE9ZSMMEo
	qY+LNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kftt9m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:13:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so5334286a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 22:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770704018; x=1771308818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdyNRRqdxDJUzqcs0bjYblKR/wx3iWD+303Ic0lmswc=;
        b=c0Cenv+PPdZTk9bDHQw3gej5HUkTXRD2rwcP73ELy+RbeGgjhz0g45zPFkJ7B8S7M7
         fxllOmJs+ll3UiR37D4ed18AEqDsPhNwCICMWPASB/At06oEtpcm1A4eC2YmoDKN2/zH
         RmXUJPP3Lj6ccPnX2SHN/+AvJQttibASkQWM7dg30xbxjT463vA4pQ4tAQAonsDIyGra
         AmLwRZDUlwIBAnsiqLXY7E6yCNdV0gkX4NSST1UZuFD4sAenNlt6sideJQEwugpwPG9D
         YnIQvpA2Ov96kf3XlVnfbRrkqi3hH6R51SCKAXy93p0V8bDQURIm5KDx/eSxIw+N7tn5
         X0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770704018; x=1771308818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdyNRRqdxDJUzqcs0bjYblKR/wx3iWD+303Ic0lmswc=;
        b=GcMVqTBiWwwipjr8ZDsJAWDGgEAQo0ak3FQZMBUanxeSWNdzcmGA/gMUTbwFBMd5vL
         sRVmaYmNV4MX6g818v+RuvfBh0GLMZpgCCGe/1IKGyUb7b72fegsQ7DBE/C2jU5BjJ2z
         rFsZWTvOwcnPsfkALJ3wGQ58fSdQpPZKIERZqtsDLIzufxRAOjXBAYce+NeasABCZkwm
         xfOIAItwuQaQk28hMMOhnYYoFvH97fuUo7Xefru+yt6uViwYQr1fgUwBK1iC/AgRRAGD
         i0vJwX2wqaokF0SCfJ+QaEDtXk93D4yWh1i92JlUjT6pzDjsUCVr9CEurhkgWy73wc9U
         ebcw==
X-Forwarded-Encrypted: i=1; AJvYcCXklldW64dukZHnAox6JFm2qyMt1OX5zpJDaBXjCpV6KAPqJxg9FC0cOWzjgQYrGLQbKGDDJAZHG+ScdukR@vger.kernel.org
X-Gm-Message-State: AOJu0YylKAUKUudmH7GPiEF9I/qz1HHhUZ0CRU/p4mBLrdxxiMY3pSf7
	2OSKyoX4X6UcPVPzgyIO8j0MIM1IKdz5BMBugrviLySuIG7uCk78MlVDBBsE1bTpcyVlePCmSBq
	mOdzRC9WMp/D/9uO+0Nkh+XNxyCXZHH1wftyQ2b8EnjqYE8gkJU7C5VjiibahdcCwSE6R
X-Gm-Gg: AZuq6aJhGNoGr5CqTpI6v1erxmpBM3nuvA1BSszSTegVrhtyI/nMn4evuOrdLteubCH
	HNx/+rjy8XdxDanJkQGtsGTqmKiAVYtn7kU+ZoIP2CqcJmt76LUQmCKaYt+nrqPgTbnat7ZloTl
	mmVP1tnxAIH8kT6kAINwXYNDKGtDuT+JXWc3voDQrTfEg1hqkVWGTG4iGx5kwBbcstLTud1hAXJ
	lr8n+AdHniwCa54u1to5b/RseRajKWjqmmtlwEFRMAeJWKZEfzYDf9PP4LA5+LDaOw/XP5+GTG+
	Hbus6ipDh+cQkTf4QE1F+96Yu0iL4EMM1Oi9M2qfkV0lxQeLtq1vkj3kRAB3NvGxlwMvdpxjfrh
	anisjCI91yPOECqRhp+2Ah1FWY9t4bWp42/1ql0u/ny5bjEv1URVkG6XG0sM9lzale+grZ6CXFb
	KJH47vEhs7/EjYJAc=
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr13600955a91.12.1770704017640;
        Mon, 09 Feb 2026 22:13:37 -0800 (PST)
X-Received: by 2002:a17:90b:5748:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-354b3bd326dmr13600937a91.12.1770704017142;
        Mon, 09 Feb 2026 22:13:37 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b31c9d89sm5624821a91.6.2026.02.09.22.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 22:13:36 -0800 (PST)
Message-ID: <ff34f47d-d2f3-4b4c-94b4-daf0c2e3b09f@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 14:13:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
 <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
 <36ourp7swd36ptbal2gd7byrppownihbpkkxvocd44u7zddc4f@igo5h4yhbxs4>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <36ourp7swd36ptbal2gd7byrppownihbpkkxvocd44u7zddc4f@igo5h4yhbxs4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1MCBTYWx0ZWRfX32fIk2OONuHo
 e6jzifOWI8ZtBbI7clDd9tWRxRTykvWbGioe4y+OChAneZAEdzFhLEH7A3F2U6gUE2YHzaSN2EE
 JHbU2D6qhzz9x+pVjA/WZWlfQ6zsqyU3mJIHpMJ89rw8Dn1JM4808l16KG/ezrqjsZVxsxKqOuk
 yxuVk4xFfd70CTIENGMXO3KJ/E4UQWihjFL0DSjfn9Z/PBnDkQ5J9mOGuF0wUWYMG2qp4jcofqB
 lsBo20O4UFivj5EIi0DERNdsD5GoWuPckAvS9Yp20lT4QSlAMDK3CDyyssJCoET6R2sSBArUG3+
 mQ6uDMvfaTkS1DXgNxbjUokSTC3xCcDHfC17r+LyHyiBQDHtgEpH1BU0rU7vHzrJZrUcPHyC4G9
 fljfHO7pMB/m1RY9UQC1V3i1rmb5M2jhCmw3C4cfbos0+gUgMUhZP3GlF9nTuw7I48szysAE3/R
 Xc54rCdmruqU5t6jnjQ==
X-Proofpoint-ORIG-GUID: zx307GrjS6JfyeSgMsy1u8RvMCowcUG8
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698acc92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pRcu1ZbixR8RBCY5_x8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zx307GrjS6JfyeSgMsy1u8RvMCowcUG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92408-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FBD81174C5
X-Rspamd-Action: no action



On 2/9/2026 8:46 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 05:00:03PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2/6/2026 6:47 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>>> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
>>>> same configuration values.
>>>
>>> Even across the various process nodes?
>>>
>> Emm,Currently, I have only checked the five platforms that already have eDP
>> PHY driver support enabled. The results are the same as stated in the commit
>> message: in DP mode and in eDP low‑vdiff mode, there are four platforms that
>> can reuse the same settings. The HPG I used was the one I found on IPCAT.
>> Regarding HRG, please move to next comment.
>>>> DP mode：
>>>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>>>> 	-glymur
>>>> eDP mode(low vdiff):
>>>> 	-glymur/sa8775p/sc8280xp/x1e80100
>>>> 	-sc7280
>>>> The current driver still keeps multiple versions of these tables and
>>>> doesn't fully support every combo PHY mode. This patch removes the
>>>> redundant configs and keeps only the sets we actually use, matching the
>>>> platforms listed above.
>>>
>>> I see that e.g. eDP Low-Vdiff swing setting for RBR is:
>>>
>> Hi, do you mean emphasis settings, i don't see 0x11	0x12 in arr[0][1].
>>> 		hamoa	kodiak
>>> arr[0][1]	0x11	0x12
>>>
>>> It may be that this changed later during tuning but it's not reflected
>>> in the docs for kodiak
>> Emm, if that, where can i get the correct value for tables.. In this patch,
>> I’m indeed quite curious why the values before the modification differ from
>> those in the HPG. I’m not sure about the reason. The HPG I used was taken
>> directly from the current go/ipcat. Could you tell me where I can obtain the
>> final table that should be used?
> 
> Use the HPG which matches the chip generation / codename.
> 
Yes, the current modifications are made according to the chip's HPG.


