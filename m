Return-Path: <linux-arm-msm+bounces-96718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP+2Do82sGkKhQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:19:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D020C2532AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E401B303B1A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B0C2FD68B;
	Tue, 10 Mar 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rtny0wMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4JkrZMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AEF2C1586
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155874; cv=none; b=WlGlLdhLOrtv30DHgtaDBHMEFRW61JDtorGGkvt+lFe8uy8g/ENXuhSAWMKSzSKDvDFEXdZ5a75sR8bbEu0JykaFqX7pK/DEaX6sVfp566LW+hkr0KRCAlza9MBG2/NXd1o4kxs1M35952AGaKV/WMxD6xyY3PBRqO3N8yWG2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155874; c=relaxed/simple;
	bh=UEVtLE67EG9SF6v2QVpRMF7PjVW1a0xU16+PCaRQFxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvO844wfMUWSuPfzarc37NjkZG8cgraK4F7SigrZLkIAoEYQr8QH7fANdEYixsKG84eo7WAzisgRoG00wEI/g7Oa+f7Z/rlfLGecH7g8i7MTOdceDdHVzeKDVwIt9/N6kZ9tevV4f6VjIyieFrZMMEQz6Xjly9OMiI0PdQ3ZdeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rtny0wMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4JkrZMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACagl43772534
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJ/ZJRrUhRnfJSLPW9+NEFkOLEF23gRvAxGVPxEHUYE=; b=Rtny0wMB6aHp13jZ
	GQwABefsSwYt+xztlkseEbq6Or/cvS0w/7aKkLMc1k1P3/avyHDJi3d9CA6Lyhfk
	FU2ubKTnX+WAwUcghj0ipUVVN16unjPsNTKg3k+Bm71kU2XBKvgCCQA3OC5SkBlX
	k5IJUPpZEzmzLdqXNKk9tBCb8V4Hz33wlOyRmDUDQFBmtcxaJbbO80cF9fg0w3Iu
	ZV5PGGo+D0cKvZEGdh3wDgtIEsaAImmnvR9F1od1/mUeXjIw1N1c8o2i6EXTEQfA
	/Wm/DnHOczFr+2n3R2FWmDJKtGw0ltLoraZGckRbzeRooIA5h4LnU/RouKAs788T
	oR3eTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj1p2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:17:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso119627685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155872; x=1773760672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ/ZJRrUhRnfJSLPW9+NEFkOLEF23gRvAxGVPxEHUYE=;
        b=H4JkrZMhds3cEb77+8uuV8uH3JE+1dtwvzGYQQ/WrdESEZN0GCOR/Tb5or4oTqPwpy
         gfjl9JpfhfcMPOJvoEJDqJpQ09lg6XXbD60HRAgd/ta/9koQ1jIfyi8+eurBqFtevZpU
         45zCTTklAGBlaSOOxX8JKEwb3vRbatuoL7WFH61UGTvKQURIQEWSB9lQj+hs7VLjc/Ph
         /QYPiB2YszXH5ZIOg86RK/ILMPaKBdSQLTpn+FS2tss7wsG07KrnX/joH+Ae9QngoQi5
         OVUpMevHKFjuN1J7nhE3mH2/OX+ggocHxl7wWyC2ErqQsIRYxIyCVBgjpW+Y1sRC9sCd
         g5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155872; x=1773760672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ/ZJRrUhRnfJSLPW9+NEFkOLEF23gRvAxGVPxEHUYE=;
        b=gvTFjjVecytLTSMUSHWJ1coos43zvAyLBCDMzXljOAMy2VFY1BZda6yipzDn8hTFiy
         rbcXHrzNQiIwoNAbLY22gw2PeuwWxWz1D5HUAWRqKouvnAgVYxEYpCxOqU5i1vdNxNRh
         LIIjWK3XL7NA5Nrz3xrBC1djsue6s5VIM5iFfNiJ5rXOA9GFYkpXvVTl4FCXOYKkbyK2
         CuqufV4L3uYuasRG2isNUPqkhQKEcm+GqP8ETPp/Jh3Va2tVrVi4fsJgd8JzFSNhMC6f
         hB1o/C1fYwbCZgX6S+B1RiMuClV0He7ZwgACLnLiBdYGLhmcdbc1J7POYDeTHoi5cLOe
         7v9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw3TdhJOJjg3haMrpCGb5hfKbFU0oNCRqblkArKW+51WIkiE3lYukwDbs4Gjf+u30UWawhx0AA+Nzdlj99@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZpPFnQ4D3DNU3IQEmy4Ci0sfbep362KI98abVdtXfYYKSODP
	9L5rFDYU4Ljm3f4D2hQgqMvZPVjKL4scYfZl+/CRkSEPM8qbAIrjD30aP28YdFLTb9I3OcH06jX
	5ycWv+T7AkmeS32+pQeICw3uRmjJXNDJc2EHDuRNr8DRq6loOrjUN15hr57F3+dR/Ktnl
X-Gm-Gg: ATEYQzwKp2FRGZzW6u1JuZfKiIHjeuIFXsnAFguVTv+ghZyBhvpyllETfaps5MYTN0K
	zyfiAvC3P9/b3Xy7h5KtJu79LLTvAb7KpxTDJYz+AWBYeT3uJeP97S8hwZrbs98SegKGtQGLU6u
	KR7YpBJ6Iv/oRlhSKjwYYZ1GHikUbtEPG0kyK2LaWhW3laMdqnYGHR4MAbp8EA1vyNyIHbIx6+t
	hz+vMl7FE30V4uTkUYFitdz2XdTv5oxMtfVLLTtplljrqC3bkVt8K4h9L3FfwCsnn/XsuQZlpyH
	7s1qWaRv8Xs86twfpea/ZTHg83tDLJi0+PDvm/EAe8dRl7H8M/vy8AsEwQ4+AycVOinTQc7YWLR
	qg6iQrKHQMrcTK9XQ45RtUWdo/OdfhLNmoTuUG1Jkob/E600YVNznkjPcOS8h0wReIOLbGKTL6x
	wHTuw=
X-Received: by 2002:a05:620a:8d05:b0:8cd:7933:8cc4 with SMTP id af79cd13be357-8cd793391e0mr699931485a.6.1773155872022;
        Tue, 10 Mar 2026 08:17:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8d05:b0:8cd:7933:8cc4 with SMTP id af79cd13be357-8cd793391e0mr699926885a.6.1773155871348;
        Tue, 10 Mar 2026 08:17:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629f7cbc78sm1579798a12.17.2026.03.10.08.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:17:50 -0700 (PDT)
Message-ID: <d8d9848e-bb9c-4eb9-881a-fe038969827a@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: make 'msm_hdmi_pm_ops' static
To: Ben Dooks <ben.dooks@codethink.co.uk>, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        simona@ffwll.ch, airlied@gmail.com
Cc: marijn.suijten@somainline.org, sean@poorly.run, jesszhan0024@gmail.com,
        abhinav.kumar@linux.dev, linux-kernel@vger.kernel.org
References: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310132501.195954-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b03620 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=1EsaE_6oAAAA:8 a=EUspDBNiAAAA:8 a=NChewM1GXYrQM836dJ4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-GUID: BPaub5fuTeOjRu1ueTbbrHdzmneVNfe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMyBTYWx0ZWRfXymF+EO1eZMgy
 vo5WNXlpTnlFUkwjpXNjDI1YZJnewvJiYV+p8hcPioVomsRmK6hdyYVHfdVC+vVTEkB6dhy7p8l
 c+afHVkU8foczK4Sj8v2uDIuc16XQbw3rC1RxRg8ZQEkKyPSbFaCvIx4rwxlZ3uoDYyRlAdvd9S
 PqqbmRXtfolV+7cXxNdHZJmVgF/uU/G4WNFydPEH0qGxbvpq1JOuworBluw9C4xbQSFBqxUxM2S
 PT0gYlySuemYQ+RKGUT1XUjxkBt+rLxNUoRhT4Izsomrp6I2TA69p2cCeD4wVSgBuCXMTZ108FP
 4tdokc3+F9ZaR/ReiPN+H7/JIhqC3DjLo9WN2e3UYXdAB0ULYkO1A734/l0cbe2suRfPtf2dOk6
 XujI1qSN6TAw47LYYrxTzLYSb/Dzesuh2mVZzuvVGDrgVpePnUkoUqQKALzUbS+mEJvssGRAz41
 /ppe5NY1bw6v2DUbc6g==
X-Proofpoint-ORIG-GUID: BPaub5fuTeOjRu1ueTbbrHdzmneVNfe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100133
X-Rspamd-Queue-Id: D020C2532AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[somainline.org,poorly.run,gmail.com,linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[codethink.co.uk,lists.freedesktop.org,vger.kernel.org,ffwll.ch,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,codethink.co.uk:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:25 PM, Ben Dooks wrote:
> The struct 'msm_hdmi_pm_ops' is not used outside of the
> file it is defined in, so make it static.
> 
> Fixes the following sparse warning:
> drivers/gpu/drm/msm/hdmi/hdmi.c:432:1: warning: symbol 'msm_hdmi_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

