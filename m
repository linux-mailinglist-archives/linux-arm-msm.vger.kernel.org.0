Return-Path: <linux-arm-msm+bounces-100139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6dGOh0xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:03:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41F339C30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 899E130607BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E45935E959;
	Thu, 26 Mar 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTF+97R8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejJ3V8Eq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C6364E88
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547699; cv=none; b=AONCE4vWWwjdWlooJ6jE87aQNSyo4YP58mvcAWoGxrd2eSFa6ootZn2HwDFnqKdzNrLWhJovUXCxj4Mj3iCUH91PFG51doSKBO2664KFZjxNOSOPMfI4u2XxwI3T37pLm4PtA7JRaUuuXDhLjsoXmeOtpFij9fuwWGicQFBqxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547699; c=relaxed/simple;
	bh=PF59VHt2YydEWX70a3ENLamMn67qWB7hiulbcGhtryk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj6ZnWt0vFAjYxFfDu8b3nJjAUkEgbHY6VrfLtIj4lK/uUycTTm85uFVjTNzRc6F2ISrCY/75RjyYBO0X6BFbHQxYA5E3IB8rFeX2rrurDarS9oXfOWhzeg0JORYpNr+m7LXwI243acyuIlwv0EZaXiifCzsvev2+FOILvNxOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTF+97R8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejJ3V8Eq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9swI2451576
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJ8HtteMMvMlhJffKR11CdAgvrwhXQNnd8G5HXi3zio=; b=VTF+97R8d1vrUy0h
	ZSD/rx+xUZ0ViyIY0boV39RaKQJHTV/7ljiDG6Vw1XRrvI3rhN8mWLk3bb6bsUd1
	hXAmsT6nmH7maEeQNUT0rGr+suqTnzb0abZ/Hgmt8L92FvAGoOL9T1OKGWB6R6aa
	PWc+zxHugQq/OcaUDIQME1oz+oL085urVjmz0j+0mo+c5wSrkMTWkb7bVIkrtQds
	v54VXayD+LF/j4hHElv3RVGMW3Un5OH+hnsd7/OaoTMBb2SH7zgLe5yvGut4OmjN
	exQ5p51mynpO4yIzml7n0MQRWWimzBMdz/V5xQ7c4yYsBe/3q/BdKx5Y3CRGVAIb
	/3MZWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t3xxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:54:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so1604992a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774547689; x=1775152489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJ8HtteMMvMlhJffKR11CdAgvrwhXQNnd8G5HXi3zio=;
        b=ejJ3V8Eq8a5lq6R1YkeuZaWPTz5mxoVCYQONFgMkS52Fm51QVnK+s22EVkUTwtN/AO
         wOcg59VyWPnM5jrm2d9rWGP3r98ubn1wUahVsmetYPHqUnWPl72CHz7oBiKzRhyhwSdz
         yFjP6OQCksUCXxBkCmRaukMWH9DVaGy3GwqXGoPT3a3fbNFO3LSwsDmugGOXRu6hVHq3
         0P8bzT67ouJ5oE4LW+jT9QwV/WsSHofNbQ4nCmXqYmfzPVskuf08ULFCUzs3Us/X39Jq
         9g4xspTZHJxanIiuW5WnrC5wYmOZWQNBqYYv0/Nh2WrTRVfPgki4uD7/CfQC1p8jss6r
         mc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547689; x=1775152489;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJ8HtteMMvMlhJffKR11CdAgvrwhXQNnd8G5HXi3zio=;
        b=kH3ZLAcHt7HTro64v+gzeQRhd7I3qnxeXdMDknYWjzQmaIq2oeh65BJfWzkxV0Qsv4
         FiflaPN84xvoqMdJ2Ivaj2wuUzIqG1yGWh4KH5t0PJxE6jPcqc/2XlDYx1eGYxW/NNoZ
         q3MWEaZ7W1C21/NgqgnnYt4Gvoe/QDIEccZ6lhxgLERGhswzCbQO38q0yWHE0DO4eAWt
         cMvmoewWF8tofKI1UXd2vilexMU1DowvdSaZS3Qvs2Qs56KwqtUS+8tpIedggGrj4ipZ
         G77vrYM9Pu8iRdJHVUbS65NeOB4Xk1Gl+CFcj45bB9yzoY0K5SZauu3dGtPGnNvfMFHH
         uXeg==
X-Gm-Message-State: AOJu0YyXa4AQSGOU1Y9zsZ0lscHKnA9h8JWfpfNTVRIMqVmMooUXda+C
	otN5yS8KSFAeMO7mhvbOm3MMOQFof3hrxMoZNdBcYmUPnW8J+xVB3ZaLeldTHbCc7jH/iXa/x9d
	CH2RvFPbgL5uSyKoVSENF7XAeHX4omquvdPAuwgpl3s6HpHnB9C0YYN4CnQIoLXU3cf6/
X-Gm-Gg: ATEYQzyK7FjvZH6lU9iTmy4DfTc2hRdiNtTJLh31JrDCW73rvJ0yq58mQJ8nzZy17Vh
	baFXYZKuP5SBP0i5s5HU5EqT/26RwCqIpxfLJruD5/qQBbFB5SPTZKVnTS4Fpf5Ix0MPZJKr985
	NEhRmxI8HPu6Hqxm5RLlVYHLUMZNWv4P8hcWJB6eMYsQOuadfojRwZqPNJd6NYEfufDjnsbA53J
	+uIeMD1n3SnO1k8dIR5TzKI2nJtCBEXashFkFt3Kl8mRXD6OsnPE1H/Cf/pcSI0Sy2XI8DndqGB
	xwgtGdN5FgWTTTGEy9o02EmM2YtWKyiTId/gkN/8Abjt5kMP4IFosJvoFRuIASDF6Ttaq3+kgn2
	v/QfLlMsfX9jnpHtjmP0AGTvGl1DotJkIrZDFeLkDCwoX
X-Received: by 2002:a17:90b:4fc4:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35c0ddd9d68mr7285485a91.27.1774547689480;
        Thu, 26 Mar 2026 10:54:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35c0ddd9d68mr7285462a91.27.1774547689017;
        Thu, 26 Mar 2026 10:54:49 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a82231sm3600247a91.6.2026.03.26.10.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 10:54:48 -0700 (PDT)
Message-ID: <316826b2-2a72-44e6-afd3-dda3ffcfbc97@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 23:24:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] drm/msm/adreno: Implement gx_is_on() for A8x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-9-fc95b8d9c017@oss.qualcomm.com>
 <b64447db-bbb0-4457-b803-ebb3eca26107@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b64447db-bbb0-4457-b803-ebb3eca26107@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c572ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ItQdk60jCWHXMXBi9I0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MIyrrEUSMU5_BvrnfghDYuGl5yjaiOc6
X-Proofpoint-ORIG-GUID: MIyrrEUSMU5_BvrnfghDYuGl5yjaiOc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyNyBTYWx0ZWRfX/AuuMcoTPf7W
 sZN6GGL+uvY9LhTSts7xUMw49/M9clOT54Rlmqy88XJ/DMjCpiAfoxtKJDaiHGIYA0HypF6UX97
 ATybbQcD4kXqulf3UwqOcQ067dYbw+F9GbnkCvDMQwr+Wa+kcNKXVtaQciq+moyaCj2A9cAIr9F
 zzy7ROWdzHRBoRJHYlm6VV38GrxrImRReOJKR2pszEvzOTUxiZr7jEuXvY2Cd6mqe3JoRIKVEhy
 ro21hJk/8qMgbFFZW1pKQGGhRS/rv/KPFzONAfE06F+vu/DsO+kz5AhAjoxccd5FkiHtjxrYWTm
 ZzX4bPWdaCK3wOfCIH6SELJX94HIhM2oczBGDW3LFXCg416Eo4kzCt8Vp1M12dyIc3pJWV33ZAB
 WXiSwRPd6EIcDJtuIw+vOHYDgwf5lS/8R4/JzdC3u7SrU0bP0Z3OzWY5Udus8oymD6QlevDCbtm
 I9shST506XZVtkwI+DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100139-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C41F339C30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:33 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> A8x has a diverged enough for a separate implementation of gx_is_on()
>> check. Add that and move them to the adreno func table.
>>
>> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Fair, but then it'd also make sense to do so for a7 which also
> ignores SPTPRAC and has a different bitfields vs a6
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Ack. Thanks.

-Akhil
> 
> Konrad


