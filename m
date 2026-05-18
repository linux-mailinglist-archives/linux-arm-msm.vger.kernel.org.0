Return-Path: <linux-arm-msm+bounces-108125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMcH9PJCmpJ8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:12:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26988568790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA28B300BBB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F367F3E1717;
	Mon, 18 May 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h87lgTl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEUyF3N9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FF3E16B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091892; cv=none; b=f8ZiWCgjTfkI9NOj388+kFwIRA87x17c8wLlVNW41wbesHVe87wNY8drbAOEp3UdiqLfkWPsbSZOze/QSLjBGdveeM98WTb/2uecAbzdl/0rYfsNajIwI0EOPIsMwkbZAVOoQ8x2Nyxdd1/8tZd02adwqQ7mHkRScvZWo1PdHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091892; c=relaxed/simple;
	bh=q/34q2DlewUzaRQg5rc1fDSDef67XMGaYj4wCX+YCJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp+u2OTaNAoP2Sjq2qHNqpSboVXa/fVpuTSsxjnabE9nfYsIq88eU9NeWPZ+IPJoNPJT5SLB8XdA/sAibQ4ECnBpMJ8HLEfHQD20MH/JonA+/o1nUlh14lIr/Cxj7oqf/cx1mdvcgB9SRfyY99l0zKE1NXMQFl1JKudmgQlX97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h87lgTl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEUyF3N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5bIAA1696569
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig94XrFtppu//nngpIGW6fYpc8m2DhYn41YRAUShq78=; b=h87lgTl0K7bH/Qjr
	TeKxslz4D4WbZjFPsNpwMJyRr3USYpqnJLfgTrpxvkfExMXB0pzEfxtXHm/Fjq7u
	igN72A7VeL3dsfCva3H07tE+JZUwa/UJASO5CHT2PnomKJwH6hwpXqmA5FKDf1Mi
	yQES5h7zpyhjBoNwb1Xnj8blBpFBhX32znZ69zWw3JzuPRWnRw9nwL5myZO+Xua2
	6VisHtfbKvtQehNQL6rmz3nCh2Oc4KTpnvjrkOhT8GPJmyEntxQB4o/dJa7UPOW3
	lo+iFa7lObEOaciadB0cOXiBJHFqE7hoDSOhEW2iUpFTcBkw/2CpuXOFO2ZQA0qY
	Zdc8dw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk0nng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:11:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fad7b0ae2so7775021cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779091888; x=1779696688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ig94XrFtppu//nngpIGW6fYpc8m2DhYn41YRAUShq78=;
        b=XEUyF3N9xapAEX+2sUSwdC47sox7US0cEAELpbIvRE3H+UBVOJny1rgTA/+SV9/6X2
         O/yQsTgsvJ9LpSbzTVU34K8/goPCxQsPQ9I2bUlc/Yk05znDj5HZjGo3d70johE+9uFs
         eVCXgEyjreLJrbcGVksiBoOXNtjIYuv1FxziAKVwD7XUCPp6L6hkFVzOzgXG9AihjOmy
         7z6HA8yys/IcFkKxD2lWNAEZMHUajCVFCVoljnuXJYf0mlgRPXw4vAphOvK+I7TjgRc+
         Gh9zFHB5AZ9VqHGoh0ph6St9Lel6mUTaD6AwVs8hNxSSXYstuJ/fByOZ/QYQpjpZ+zgg
         833Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091888; x=1779696688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig94XrFtppu//nngpIGW6fYpc8m2DhYn41YRAUShq78=;
        b=tWPS5Za3m6Ju6Hd12QNHwL64LCwkpcNEI8laO8o2WLgomUDBVJWm9EXWuDrxqKcSN6
         RJb1UZ8YQHI396VSF2996MjpQtVwe2wXmu8z16c45B5f3ino74OFYJSL4bqpW0OaXTcM
         VdKmLw4gyf0sDELVRgFsjYiWDlod9MymDowSBqvFr6WiOLrxEwQ25KomKIIJBW5hzE05
         hOlyoAOck2bN96KEZ0L51i5uPfBp2OKmMbjCdmA2k9OVjpbZZ9/EVmURc7RF5xB0nAvn
         h3X/qK4tGW9k9MR7oSBLnIA3nicIA60hltFLEUi0lFJiGk6bf/CYWVgVqK+Ct0zG0Mej
         iI8g==
X-Gm-Message-State: AOJu0YxyR//ZjwWHPU30KEKb9+5OZLu4OvDaiGiikGZrXFJRyKSuaEhy
	roqn6SJ2vuDKj07UaplEo3zz2+zi/SjDjvzKWxTfnne2YHCj35tHGHM7qnztMe8Os54tGbvGzie
	M7akwvFRn12ifkw8/wHYCIGvnjqbASAyFCilkyXj3RIWBTkG2qEWh6HYJCPD3ys/vu56n
X-Gm-Gg: Acq92OGsrF2wK9d8xhYaL79pSkos/z5ZB8SehmcOX2DPJmh6Aq7DCqbPeIl/15Hv2Qy
	thbBQpH2QdFTTcnh7THpnZomzN/fWmE0YN7D1dQtG668NKUuamPvg4i6ldtGdolgv/dwqaRZy/z
	6MsQUTmt8RK+3nGb5Lc7bz0OxBqXhdeg8sJF0BDqPndNtRpLpQN6BtMa11jaM3advOyGbAHQMCi
	SK+oaJyzkhzVdr53MDM5wSwjR0SYX8NVqxm9ABdfHRm570vDSzwWNsmOSBF5lHsI56TiSdw2YE0
	eAK5vlGIsec3Glvv0CtK5tpRA5x3tcdHeKgrQtEOA14IaDIupnpKLBrqZEY30WUhGcHZwK8D9ZO
	jvaEaYJUWDbttAjPQWssXvKk8GmsrD2z1cyeCcHM8HSl7/IY2+ujac4f4sNqiyll8HqLGJX7NjV
	Lk1szpbKQRdbNuKQ==
X-Received: by 2002:ac8:5ac5:0:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-5165a26ee80mr148683201cf.7.1779091887670;
        Mon, 18 May 2026 01:11:27 -0700 (PDT)
X-Received: by 2002:ac8:5ac5:0:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-5165a26ee80mr148682851cf.7.1779091887189;
        Mon, 18 May 2026 01:11:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e4e28esm520966766b.48.2026.05.18.01.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:11:26 -0700 (PDT)
Message-ID: <fd2f6876-9a23-401f-98b2-68ea9cd0e054@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:11:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OCBTYWx0ZWRfX7B+UYWPxDAgo
 pEye4Lb3rtCLjHCk6LD2vBoTmzqdUisNAw0vE7TWknGY8erEp/1LEMNGpH9cPT/F/meNQouUTvz
 gEdt7roS19iF6KreWcHRwDvEidhT0N6hUdm4j3GTy/GUEien0ShKzBwJAQN1Mb/6kGmPBdNs7y6
 JsBtZyyo6P8GQVPcmn+DEXLD1m5Ii60565DmuEdcg1IHOD3SL9rDKzxu+QwrMtHYQdidRwz4TTk
 lgX/JbMQPbHySqX/tVkp6bcD1vZxZxNwtbUE8obZD93rPOvVb69USTCvOv152Ebwt/MEp8CrTQw
 DkziLk6CYddQKfwVy7xml0hq8dOJcPqhG1ER5zWWJRtL9LathBZTS6cPElluydR/en6SlDye4Sn
 jelH8wKx0Q9I00D/IkhHo3xDWxaeJ60qeT5KyhBL3QtATNzCuDhMpmTX7yBMKGyDwLeVxkBGvby
 B3eQPZWgZZmBbJ9wFpg==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0ac9b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TDXYLTSiAN9VwpVo4wMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Hv65AR2sH-dsNM0gJoGj7Mq9q3CzO4Nh
X-Proofpoint-ORIG-GUID: Hv65AR2sH-dsNM0gJoGj7Mq9q3CzO4Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180078
X-Rspamd-Queue-Id: 26988568790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108125-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 10:07 PM, Akhil P Oommen wrote:
> Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
> enable CLX feature support on Adreno X2-85 GPU present in the Glymur
> chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

