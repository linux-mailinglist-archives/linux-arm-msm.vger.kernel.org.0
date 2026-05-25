Return-Path: <linux-arm-msm+bounces-109671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB6jG1RQFGrmMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:36:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB05CB3A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D977300DD7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4320386557;
	Mon, 25 May 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdzgqagf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK1Zl6Uw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4234C9A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716177; cv=none; b=tPm1MM0zIkgPeKfMy0zg9PRS4nDzAwgrPCJIniwHqFhbYKawvDQOkmVd2FACMuJ8UIq5a5N3vBh1g2NvLIzohyg4N1VpYBvVH3pyW6hHTqZa3ORJp/3thyR2HgIUfOZi+l2Z2lals038K+tB2C+gOQxP3Lp7R4EU8odrZ2bPtaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716177; c=relaxed/simple;
	bh=UjysenrYfKf2Pg6BhbPgSRct23CBqIEMdqshjSUEO4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9uR5ZyBG6tyva8l59hmRu7WdMjYSpLO6DHlu0zH35tEm2xvQduZjiR9Ve+hhafpOA68IEwA14sqE9AoiocmJObkaPwk2nzQ9VzzWkGyl6hndPCvDGE2jgtyvWRgCGDl2AgGqr/ZsHFknSig1pGRXc5khr4kAikYo9XmambG0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdzgqagf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iK1Zl6Uw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBAL9m767582
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkAVthLnfyAhplTespkvjb8SZ60S4Dh4P0IflCERNoQ=; b=mdzgqagf1O3zzUHc
	vHcBbRtTJYJ91YULjQVI+koNPIfrsiggWgZFY7slpS1SyoW+pfryM4bn6wBl44AY
	EazfNTqMl7Zs/0Ngvlpn/rBTZvCKdOeEH+WEIZBzWbNnXMZ//IQv9cAZLzLjIlma
	On1JfmCxLI9oj0WVCekC/uHcx27LkZAuQgkvchAVz0Joo4mEWqt7c7wxGOylAMC+
	+uzmWv4BJCjh+KVfkiXkvlAITSj+tLtOJdu0lWPUvon2J22TlP9cVYTgDFxxxBBU
	B3C1GEJH0lISwB+nFo3UTtGGdAwu4lsfpZODn4q4hqKxCsYE6bud9jEB7UNPJZ2q
	EQhwdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0x181-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:36:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b9d0162aso71864385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779716175; x=1780320975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkAVthLnfyAhplTespkvjb8SZ60S4Dh4P0IflCERNoQ=;
        b=iK1Zl6Uwtx8Y9qrm9li1Agi1eWxpwabezexVSLqQtq9abcI8BTy0cpRczifhbAL6mG
         2eK1PkcAp+/7dmv6qmmnFSGDq1D7TXbg3f7KqlcpbWYPjR09Yl3eamoIrBJdtdZHTWFv
         j49XG5SNCoqXVzd3Dw39iskunS5p8L8Xw/L4NquguLR8YR/XqLIX4hVo+icqdILvhp1R
         jr7rz/ke8Buxz/kQjQY2FqQeFLterT7N0eoukSf2TG/Qs9+OI9FWPBATxa/6R1+pOQs7
         7M86o4OiTgapS+xEuPEUiysbTwGfxER8PAJrJPfc7y2QKtEFwq+0g4rznjUUOX03wHPz
         S82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716175; x=1780320975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkAVthLnfyAhplTespkvjb8SZ60S4Dh4P0IflCERNoQ=;
        b=i0K1PhyI3oER8StooFoC9i3PhuxXQYaBv2l4yuwP508vBWCGr56fsHGzm21VfUCH34
         dG9UP8epceZna2fOp5v/IwCKJVfXuTWaag9IXey/pG0YLYyrelUOcMrokDLHC/uMAaKV
         8bGQF+aHTGq+c5uTALGftHnsoZG/X506XoPY3OQUEeRo9McfCSx9JiWzvAuOLkXhkntX
         /O6Z1GoE5njyyG1rfY091sJ4vYfIo4mJruxF5PiSB1mhADApovr3ynGDeAVwuGlgR9DL
         /YaXeTW+ljngYoqRNwDIo77B4YuUtujFD+NVN5DjLCPGhnERgIVlZagb2rvybgy6kPsr
         CAzA==
X-Gm-Message-State: AOJu0Yw5XErP3z+LKIVp0sZIWBHRib11/ljSUGsKD2hyiRuexg9tZzVk
	rxTN38ayFo6QRhD6GSi86eylZc9D5MPwYa8XdqHohOSuRY1QUmRPzJAk9uP6O4ajE5smtVNV+ZY
	NYpb6bBUxsgbGDCe4AJtmQMKDQhfF5OW1/IV9qFDlAugkUIGZwxBoXiMt9x+AVhYz46VN
X-Gm-Gg: Acq92OGGkDPA+VTXPu+jlKWSGicwQW3yoHvVyz84+/s7akTdZ9yk7Y4s8wUwBYeVTwz
	Q+cP721aSXX8Wt5dSHMEK488au934siv67EyFTsZOZqoqGHE5QdG26pPrNmOAlN25SZiSktRnrd
	p88esWaJcr+RDwaJ9WtlmRhprvSzJBJyc9sYNrt4DB7gXxiLUmLcxrEuXLucsC+OCo+Xz7U1aGP
	vRkDIQiCSnRpRUhQ1+E+hoaDriMsVuY6m6D46Dy0moB6/t1y4K91M9DWX+lzMVMe/QzF2NhQrfL
	tHe6Rjz4gGz8YsWHiAxC4yLZSEyKfH/MtttHwrPw4ikRryL/EnEbF17Ln/Z60VKCUtsYGzoM2gp
	cvFsD3aSebm+Xz1y8ob20ddYHjPlgTF5ASyRoVqnIxk5/Dn3xT2fvNfLy
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr1378456185a.6.1779716175009;
        Mon, 25 May 2026 06:36:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr1378453585a.6.1779716174573;
        Mon, 25 May 2026 06:36:14 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb427027sm3995814a12.25.2026.05.25.06.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:36:13 -0700 (PDT)
Message-ID: <f7872330-4f95-49ff-9635-87c115c15cf9@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/msm/dp: Add sink_count to debug logs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-8-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-8-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XNUTmXybpXJZ4dVHRLEqM6bUbcI_N6pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfX9ebxIeq6Y13h
 Bz/0ckBUYEZ7jpgmnQzJD2KqfKXqKV81V4yfeXgQL4uVZmSPf+cWYyF3Gc9rXN7EwoK4ermBM2/
 1YklRifWrn6dNJgQ9VTOFKadC7x3YVMCduvDX+Y309pb84Q0/3yWWFhV46geFBYL2TF74QnhCyd
 Ca2t/2614xvZW9Gm6ciomOr6WHxBcJOvQMjzk0Rc7FPZ3hP8wjipXCgf9cOBsFol/gm06D8J+MV
 7ifma/IMy1UHK2gPk8bfR17thPuTh/D19FhclELs0KWWZq224ob9vFdysGyRtue8VtKHz0TdYA2
 VaHi3dMks1v7atQxU/f7QFqyvWFbMqtbhcIVjnFaQu1ngHZXKxzkcLIgTLoxJGPRXizG4nHcD3q
 ud7/xZgbl91Fayefj5sIT4ZkoEXse0rlQ+QEkPgiX0hM9m5FJq6TWgFmtM1HKWKM9esIrkIE6AQ
 +b5RUUEUHg11E8djfPw==
X-Proofpoint-GUID: XNUTmXybpXJZ4dVHRLEqM6bUbcI_N6pl
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a145050 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iZbbsgHGrt-r5UQur64A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109671-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBFB05CB3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Add sink count to the debug logs for [un]plug and HPD IRQ handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> [DB: dropped link_ready handling]
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

