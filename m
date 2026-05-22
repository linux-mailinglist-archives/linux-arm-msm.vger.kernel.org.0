Return-Path: <linux-arm-msm+bounces-109216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI+9M2IlEGoYUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:44:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E75B1672
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA86D30725F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE573BF673;
	Fri, 22 May 2026 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puFzssaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuhZbJFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12A3A6B83
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442797; cv=none; b=MXaiS9PBOuH3PhCP5ISsEnmvFoFBodvcbVRwzjCj+vN2T1LP/FoMgzP5RpiErm3WEuOnzUMVSOsV+KptfZwA2lpI58MvfI/m25UgEzb4hP+36YZDY4ga0mLYa5cJvPqKymPuwnZImiAtU5NGxX3OGaf1mQY/GUfm7pcdXZYJFkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442797; c=relaxed/simple;
	bh=F9srFZLSCu9PEJgkT+xS2k/d54cF8oIvYewLub3AXaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S151O83P/JeSkDrf+xusq6jX4tiMGdnsmxyyTI//+S514wNSSKfftYcQtE53HLs2wdxWKsmuDNbTjj0ZF8QLxm8FEIKoK11gtkziacH78lj+AnP2XKg8MkpKcDHqW0CIm74TnWrSITui0970BJDOy8Zb3KXpsvwUA6q8TQQjGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puFzssaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuhZbJFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Dh4l3005101
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=; b=puFzssaYuhrJx5xm
	QRJW2mO5np/Mon+Kw4DMB0vk73EnKszD2lceFKUYO10QUYo47PWn9o9iaA5a7e6d
	J4b3kTOHqaLep58dwF3o8rrLv/wycaPQMKEVOn39rVceq7L8UgeKDk1WOJcGw3cW
	PM4La5GiF0Pyx49F5rJZun+F4ll++r5FyjlCDLp6pdBqzD7ge6Ud3KFKbGR8Ncg8
	Ywh1jepAbN+/ZagiGRTmDgG4XfbIDuh59yjs107XBOzvQ4UAb3Xm4z1L52B+lQBl
	irBU5tgSNV2Tjdr/ujokIyQ6xyyV+cl4ublaLO74e2vUCDjjd+n8bT7TtXxV3WxG
	g/eDYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9c6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:39:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b79adeb6so15075385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442793; x=1780047593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=;
        b=ZuhZbJFjyzaBCS4w9RC+Y0PnjPABAXoLOHNOLQ8Mjit5f9z2/ZGiLg9GrWuAhPpq2w
         LRT8/gcCD2r+UQhUdXiD8HBjrcTYxVqzLrCNyp3lj0UBXp2fwHiFEGebCaiJVyNMKujY
         kvar6pUzZ3YzmQxN0cxKyIyP2VZp+OOud1XAFsjWiYlXmjODlNjCEJqw99u79bkEeDK0
         q8pXF8Ew6rQMsKX+nqBwj5db9NhMhFnuE6GSOCzAJZwOy9T9NruYiukERf1cO0TBPB/t
         U8aJGHdkVUv/ImxKOJJtA1wNtJIaYnPDXp1ra3tXMZkw+sVqls6Eqdv34jLRRAhpAGix
         xxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442793; x=1780047593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZi6CGqyMwgYn7xlaB2Q8iqRILRAoRP37K/MNg/r1nQ=;
        b=XAhjGEbh/Y52a94c8KyukGaxadmie3fdZKVUNbrrrYDsSOezh+6E5mYe18RApR6X03
         Kms/B7+Yfrh8+3foOj8tRPxqRx7Mqr4BX+Lt9b2zMn4lJMBwW3Hvq/dZy4fmLWqxPYGj
         XyooPjuudJYKJ1us2uNwSg+YtmOKTYCir0eWq4zGh7z3WJAyhYG9ofTUYHuD4a8YncO+
         jOvgK6ENd4vOg77rTjTlZd1yKX1pS8dyiDYfWg/kPCWnUwFG78L2uQLotQgX2VCPFtkl
         2q4rv88FDXLn20MkC5MQ9Tb8CkOd+RkhmvnmyD0E/Lt9BOXbh+K9LpmXjC/tOzUpdBYz
         o6hA==
X-Forwarded-Encrypted: i=1; AFNElJ9yt2KoNOwGG5CRRx5pU6+jYle4r7MAoI8/0ZegO4FKRW3amcj19/R/sZQTWplFQfiI76PNrckEb+8OXDlF@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2Jj5HEJOJMEF3f72YvdnNjb+tDvQB8167h6ClYme4+JBGOPw
	RbaI9LSGfAQOy1SbQQPs64ug2tu2yy+uIp1hLpaFjbVcTh+UFEXHBaFehiHdh+IBvSSFkygPwuN
	CTgNPu1z7k/YM/3Cchug0TJwS26lMa2Xo2YmeHsCIKMrWGdPo8KRfUjzRS60Y8HCdikgz
X-Gm-Gg: Acq92OHm0LFGeNtALC/RLYxlQIIY1mTC5BK4BQZY5/QHuXMr7Le7vVV/nO+xCuQoJXO
	2TS7BiYVUo2FBuwswRCAYaGfV99de+XpoGQsDTd5yQzM0x6po3UkjhyMEliWGHPnAqZcbT+Z4Op
	L/OkaZGZ/43W5V5OHIC4wMFBtlVhodT13HWOQmdPhPwtoFgyJ5eTpF/ef+Czuiihxw16mNBTdrL
	2GEZLnSUaBzqQf5gFBxe3ydku6WtQZ/BKQbmFtzifLCZcSRbgjGe7b3RfJn7JJ3cSqQ0mA/m61e
	4fFMUXJpGjr4rQObsXPSsVCAOGmnkhC6IDDgmmyL5zjJhVWInPKsRt/q4PjsqvVyrQtekPJK7FH
	PiqGQ4H3SXQyxDhP1hKudpGzUQ/FRsLUuoFvdzd1BsZreHQ==
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr29963281cf.6.1779442793266;
        Fri, 22 May 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4a07:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-516d43cfdbemr29962971cf.6.1779442792837;
        Fri, 22 May 2026 02:39:52 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dfb2esm35573166b.59.2026.05.22.02.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:39:51 -0700 (PDT)
Message-ID: <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10246a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=ceajz_fLbYyYHEW_QOYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfXy+DAdEx45xHs
 cMJPFDP4e8YtZSdoN7GcRWQHR+A7iYm66sfC22FRnWi+TsGyt9Wz73UPvVtWB0aX3JvQCwfUPlz
 GK0hngU6tianCgpYI7naOYd+YT6rdAZBfx0vgRhwehj5USqJVGn2fEZYkA/ZWcGTmL6MWd3P+We
 mpc3K1q/eZByu4JiNeVMyL9PUjkECwjusuld1T3PB9w24KEY3uw1Y5+t+5vvpj0w4kNKdiRGQku
 u6kB9hoxP+QRoel+SsDlwU/wI1u5fgp0YfHfgLTF7zi4NohB12dJti6v7EPxDpoozCdDQaH0Alr
 W/tyQAze2nR/b5oLjqIYqeeQYIE41ZTz5RzJcK+wpKybEJ2ziG2LnEaCUh82OG2pCKDRxXmI+K/
 4+1POdtwyql3DB7jyXbxVxW0f01MJrOr68iNvTHcwOpZR+Zw0wjRSKmEnc2BLizrPl0UdNtzPKu
 0zQYNwSFpHbXZUmxDkw==
X-Proofpoint-GUID: ZEnrjIEm52_SMNdswj10ukGIXxc7fXN_
X-Proofpoint-ORIG-GUID: ZEnrjIEm52_SMNdswj10ukGIXxc7fXN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-109216-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 464E75B1672
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 9:38 PM, Akhil P Oommen wrote:
> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>> the A8x family.
>>>>
>>>> This series is marked as RFC because it depends on a few other in review
>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>
>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>> review and has been applied.
>>>>
>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>
>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>
>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>
>> Unfortunately patchwork doesn't capture tags from the responses to the
>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>
>>
> 
> There will be another rev to remove the RFC tag which will hopefully
> have my R-b tag. ;)

Do we have a resolution on whether the proposed fuse values
are OK for this platform?

Konrad

