Return-Path: <linux-arm-msm+bounces-99818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBgOOXevw2nAtAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:48:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DE3226E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D87B83016EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0E939D6F7;
	Wed, 25 Mar 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBP0vsBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+YENcXM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E8433D6FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431835; cv=none; b=QJPg/D5BXHHx56VoGmIKGEn5Fbgr7ce8ufMYG3/jAlN1f5rMIcuHvkDnVesYbzgSZJ5d2D9jqLVF0aCZ412JY5ddhbBYGW5xIgs13Pb3BiIPCE7gwhcd972yXRng5nNFIDH6o7SIgm73maB2qiHQjqxY6VXOqbSqueiGiWz2b5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431835; c=relaxed/simple;
	bh=CavqAGZjEP1I1daNzNKVeOhK0o3Bobebnr7Nbll2QDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJHKG2kdICy2l75CvN+4a42R6Gfd2/2Ub1cdIIPGlZssMpYYJFmTJ0qpzKHkF0REG3iKDtmuus86k/WbVqyYozxtWrf7vHh0uDgAdpDjWwB+3F1RqZvJj01MHt76692v7N/veglnDf7PNtFbNsDEsgYFCALOwJvnLD9w9zN1ujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBP0vsBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+YENcXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5a0ZD2076393
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkqxXAzJzeIBhYN3iFJb/gRp0wjXOhLvLPUgoC0UA+M=; b=XBP0vsBefmet0/vX
	j1RRWDyE9eNAM2F9LOckQO2rzRSxmDCim3Hw7PolnmkE+EJr8/xRapecWBsTOym7
	TtDa4CD0Ynoudf37bIhEtneHdN+cbZu+PZAsGO1AK8HGabV7r6Fq3bpAoWeR24vp
	YLGnOOkm8FwbnpXylj16dd7odocnpi+RD4oMFzX45QxhWuxwkmtMKatgdLeJD+Rp
	MBpBnzncrjWupiLqLqnCdAtGNNCr6LoI7HyKCiPz+o8AOfi0r7/lOP0HzmTcoSHC
	oLEjvA7n6i7PH1SLp58L9Nu9wDWJFAOtSjnsWbfziCbmI366XuT2IjYIjqzyU5Uw
	FE2a7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412h4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:43:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50947db2e97so50182911cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774431831; x=1775036631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkqxXAzJzeIBhYN3iFJb/gRp0wjXOhLvLPUgoC0UA+M=;
        b=d+YENcXMUJJKfA00i10WhQOdnWI31c++hJ4w4awCWIvLgRbuS32B//6bdzcidcAaGA
         j9wloZU9YPaqTdD2eLqdzGom6PMZFX35fjXZVMpu7h6W0xO2vCEJ9PiKNoW4ecmiLtvX
         rR8Dd1MoFpS2VjVZoDjsXh7AJtvgPMrspkcIAGhIiHMfciFTtMhczheCi3qVZn0KgOH3
         PRmpVEhJvfAAC39Wxyigx/ZZ+JTO8kt2vJonbu85y9+aUNB3fDKYXbHMyc1wa4/MLctj
         hl133hIhcfGbhyE9D5RiR6XKxiplG1QzUqob7gydiT5C5Jt7WYSg9DYNNX+yz8FWECJP
         iuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431831; x=1775036631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkqxXAzJzeIBhYN3iFJb/gRp0wjXOhLvLPUgoC0UA+M=;
        b=LnqIA/lijuLJy/RrUyVqNASVq7LzNmJAYxmYndNWALf4Adbzdb2oG1cmyeEPe2uvsB
         dhLyVM1ty+/LhMfh9f/fV3CKgu5GZVKdhYO0Zia2pFjO2S/JoIAN+03oy8+snb4pf/8K
         Q4/5lhcRmGLxMBvlyOLF/fSFlS4wIgIVsdFUcGbZ7vCRIzCK7LCeVQmd9lSE6rAJvQrc
         9LWNGU3+W8OyHUATaXXduLcebwG4bAgPnUis0V/cIh/TfBHYkB5MR1Es8utn7KqqA94z
         NE4Tyd/FpqfaXO1DA/5hsP1PboFTJkmmKNTALPS0OkpcWd7fhyU57eipiC4RH/0JqiiT
         8GlA==
X-Gm-Message-State: AOJu0Ywpr6L3EvD8WXfr83CU6Qai757mJYg/mpPxH/cX/FGB4lzH0rqL
	TaCnWOyzRPiOj2O91dbibqF/WjeZvkBjTyJQKKx6uFtsnl8Rnmr0wiewy0DUCI7Vl6RGDew8QHd
	9i4hoW/xuyXPxU13n2RxBuKjY6gks23U9FovAkEXTcJ3gTyQjvaWuEfA6W1GgrpXOsAVyNv4sta
	92
X-Gm-Gg: ATEYQzyXjfQWD2QHeZ1q/QZngJsuyQgFhbopn2GKLySSZy97WlcRJyFCGjrIOUIfyBX
	tEqhhjfYKa5ijV1RUi+h1cHLTN01PuPqWJblyV957L2saiHABEAb6KGsUBLvMZzKSGaaXslQ5mI
	tL/3R0ns2snUWsidsoheDwKkCOwBXFyF4IAvzJB908Huun1PJlyWGzRGu2Zf4DDgYpg2XXV03qJ
	yVe954zjiaA/oDXKjtYdsGT8cfpMVZxm13PzJnqfp7MusbOnYCEqSt21DDJxHVS1Depf0Fwy069
	Cs/FTtfnTpoXd6B5MzORvPWlEIXwMjghLVa5qLrXFmIKh8tmEcvnWxRXAoYthfntEfeXV0+x72d
	RrmWOr5OfM2L9n2OLaFVH43JHo7yc5SIfNti8Oywh3oH4fElGjsfiE3rcPc9dwFFCHc1bj+CgZP
	/2jmU=
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr3610411cf.6.1774431830882;
        Wed, 25 Mar 2026 02:43:50 -0700 (PDT)
X-Received: by 2002:a05:622a:5915:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50b8cccaab4mr3610151cf.6.1774431830456;
        Wed, 25 Mar 2026 02:43:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm745883066b.25.2026.03.25.02.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:43:49 -0700 (PDT)
Message-ID: <9d4a019d-0714-43cd-9ffa-5351195c45b1@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop INTF_0 on MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260325-drop-8953-intf-v1-1-d80e214a1a75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-drop-8953-intf-v1-1-d80e214a1a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3ae57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hk87uI6hEoqpmA19PHYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: J_TMzF06BP7JUHxReYDTkIjFI3GnPFzV
X-Proofpoint-ORIG-GUID: J_TMzF06BP7JUHxReYDTkIjFI3GnPFzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2OCBTYWx0ZWRfXxmJHkPLmK+Mc
 R/DZRQPlVLYS+m9FG5To+ND1kzv40diSindM9wxH3AO/3X8ha+fpOn+DCij+WBz1rcG9eTsxIlU
 DGci3XSe8VEc1TNPl42U8i5aRgbWixoBRYn6Ym/K4Ht5hCelUUxt8TCEFWgAWU9PjKN+ihrq/5j
 lTouPkWFE1Z6BJEhCXkPMUHwzXCv3c7glUPjmwjOevBlqL1mmmnuUCiuEmbNKcNY1ToQG0hW+cT
 zPdN21lRf4j2yRzQhez5Y4HPICFLW5Jq0HNvPYeYmfs/tipF10AXs8eMZcmzcPdbweGHnHuUHis
 Z80pAcWb668C9Xsje+tot0TwK2FvoyXiFLfT4/wPO9S1uTFMwVJKq61PruJ9YfRgH7BD/Tlw6Af
 aoztKqy+0lFi+kUbJMP4/h6WeLsdHCaiREcdaN/dksQny+TkYafsEydAvxUM+d/DFhrdCzPl4/e
 xQy6LRMlm/TjmjO77Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B4DE3226E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 6:35 AM, Dmitry Baryshkov wrote:
> There is no INTF_0 on MSM8953. Currently catalog lists dummy INTF_NONE
> entry for it. Drop it from the catalog.
> 
> Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

