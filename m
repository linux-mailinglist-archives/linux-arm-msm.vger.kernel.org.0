Return-Path: <linux-arm-msm+bounces-97408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJcxEmrms2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:26:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA7281678
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57DC5300E3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A0E331215;
	Fri, 13 Mar 2026 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KepYOX5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxiyDSUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522511F192E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397607; cv=none; b=qwBFXtLzps6mfC3/75IO1G6R8b45lp3XoiC7vZRUrcjzS46xOtU6dY95Q8VUlOW4yYa13zG4KkO0A0p+9NC2NvcRYXYihowFB5M8wvdkBvD8FplfKnZoiGeEiRJxdm2kzxU/fvgn4ykTMDHmwZai1rBc60qR8vhIHEZvPEszj3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397607; c=relaxed/simple;
	bh=3njPHOOGU+0//5onfsiFlXuU0+zVDCoFtdVGZixFhX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaW+wJ6Av1PbNbP9Un9UL/KO8igXKbk/yHhGGd4sq1r4c1umLcwRjtnPmvqUPqwi+XiNDWtcifJ1rIVllYjl11Wxu4AxV6NMoj+WV9VpRfCq1YiTgfBkoCzQH6dFyJvcqgKHPNxm1tWNTavWLBFpBw5/JOCOiKXlXLc8BSXkKow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KepYOX5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxiyDSUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5teVi3342534
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2/OSAiGAUHW4XnsE0CTB6bJV6KzZftaOknR1VBiwHI=; b=KepYOX5BnxIYCRuJ
	94ssczBs/31VO4ERQfi0c76tisz98nntJRcyUwitreyg1lxlnTIr92vCeJJOubtk
	og/D0MqZ+slVoNGPItlGQ2Zb/FqHakaRG0JdhSby9EBghW8fH5Eid6Ih85PRM62e
	uQG0zVC6XmNQ5xZ5dlksUS8gv9F7ANRFV0nj26ONBWF4urDoL6yAVtQGvUthoEqB
	jtLa7t1gzecwUllQfxVaLMwLalm94hesGX74fa/UpVD7WdU7bDmRJfuyT+xz8MQm
	/HzRXTpsMG1y9ecs7WIyUYP2pF2YbKST30MK9rSCKDshfgHoP8lI16hB8vyeyuf+
	9mOjhg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4crg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:26:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0100410fso12062006d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397604; x=1774002404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2/OSAiGAUHW4XnsE0CTB6bJV6KzZftaOknR1VBiwHI=;
        b=ZxiyDSUSlB1uG3R5qwtxgl/pSgka9zmskyAzJRecbaJhGIJqWxjEGEK5sf7+udiGTZ
         pa5XiqPhQmve/JYRsj6+NkgTT/+06s2B2NVVeG/G5AS08CwZbpMK0Ultlc8Tulz00KiZ
         wQA+ME4cBG6rJJD1T19jkW7apNcDDsz0Fk0BY92oTHE3vp2R5Fv3KNw5RmW+TFuIqaW1
         FD5liNedO0uS6r83RmI2hbaTjh8+GuBXVs7M6NNCVcLXINW0KUa6Vq6vd/x4bR7omwqv
         H/fgxwu6g03dzy8Yxjp+2ZqQYA3yuQiQA5DVqxWQBdvduhvvpQpUh/frk9Ir89Zuj3ef
         MrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397604; x=1774002404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2/OSAiGAUHW4XnsE0CTB6bJV6KzZftaOknR1VBiwHI=;
        b=dAJsE90CaL+xKxHvzjuIeri/tszwRxOaU/gvF+XXwXUtBK4H/hL8Jmd9eYyD1vVTZp
         plN0F+w/AYy/0uhY8FK8zIqts3AjNYPhCXcR0R7LcjMfZYLun/Q5p6IwUy26Ear9a8Qf
         xZup4MC2OjZFWlHZ2iuNfjnRzMZqryAjhr/0woz4IxRygy7oTY0bkiPA/F1/rrRBZ6Tk
         9Ax5igXCBJMJ4yHGhiT7v/2idqwEFqTCL+Xt/90XRIUJnOeICAkOrW5nCjBKOiD5Z4l8
         lXmvv+gpqgzuXvVrZ1EBMp4s0W2Jthtjx4RgefFJfTnMY8tyFBfis9wvDQNvr8MNHtko
         jDkw==
X-Gm-Message-State: AOJu0YyTF5Ecg027UBy2VVG2aeUdM/Sdkdb7XtxcFxZ57rPPrgAUIsRC
	1ccSXLylwzExGWhxUjvAkLKuOyoPGAFvYNR7s/Muu52WLSzNOzwU8IbOf2y5UybhYtNs73YCMws
	HSSOZY5dYHW/9VmFfvWn/d7MOMZg4dX2Hb4p5MW8fcALBy44Zj/e6Xq1yBvtspN3ZjUdJP+fEIO
	OJ
X-Gm-Gg: ATEYQzzfG7iMRWVQJDuMwmZrqMb7RTEO/o2MCq+jRt0Q1GnD2zpBJuhb5MwrbsxiOdM
	LBxrzJCAj6XRG/d/UOxGslkNQ3naGT8lNUV3++MJCYvaQutORf4oA19bHzEKVEiBifRPtb8yEkX
	HhduAE6+m+ADLu+0vNlQy7XMCIHVb4NTIBn31J8tr+83pNs3M2H4ec6ySo4H+LuSQnB5m5bVAEH
	wfhNNPOKZXZPiP0Y9F67O3inev3MaEaAhABgErYK0OSkY+6GV78FXLBAofu2v+ur4+PxHYUt3kT
	9HxS+Qw/Bl0fV4hIU/jgq3ZzOyfITr3zfr0kMZUT5MBjYEmw96W70WbNOjzUNBjfSXJNqcRljUi
	H/qOXrIoUa1K9oi7AEb06qp8hAAMOMG9ljpjRUxlhq7iOSu7WxCzl4BYF5awDaUcFnnTGbcv+Iy
	bOUG8=
X-Received: by 2002:a05:6214:470f:b0:89a:5323:8602 with SMTP id 6a1803df08f44-89a8203e6efmr27306246d6.5.1773397604628;
        Fri, 13 Mar 2026 03:26:44 -0700 (PDT)
X-Received: by 2002:a05:6214:470f:b0:89a:5323:8602 with SMTP id 6a1803df08f44-89a8203e6efmr27306086d6.5.1773397604203;
        Fri, 13 Mar 2026 03:26:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf3db5asm35694666b.56.2026.03.13.03.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:26:42 -0700 (PDT)
Message-ID: <b914470d-5ab7-48aa-858c-58d8863ebdb5@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:26:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/27] soc: qcom: ubwc: drop macrotile_mode from the
 database
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
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tMj85aghhv_pBOPPadzX_EY6_7Bc_AOk
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e665 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I54dV6YZZfg9ki0ab94A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MSBTYWx0ZWRfX/6ZZ7aN1zVCt
 HTcGm659dVeNk4lZQhGAx04AMGOazXYKDtIGnowkS3SWKAoJECcvPHdjk6IWxN91Ha1QdIHXQI5
 h5pXYu5WhEejYaX55peQY7isxchi6lsTpSHvrgFLaON9Vjoogw3HknSdUJgCCyNL+scGOMaw6j/
 pxSLMDqbvKOT0gavE/KSVMl54zVZnmxxDsVXbZX2JmNYO88JSdIz0TsZ58hzJLS41TVvEmHCpP4
 E1IlPTRVDP2o3m+qW92SXIj/vyrk22W+z3g8mz78SE//0ds9XZQi98DGbwzFikkNDFavpgBcpPM
 49jaansh95sAd46MC+wPqL4TaH3fpjQ9U+bNNp0lCmWBgfOQIqvjkbUEedAcbwTQyUvnCFQZeoS
 8blnnH3WrJHFQCn83Q+vDTrwAdcQeKtl49vTiahol01tn+1hYIDuv9bPD4qFb4OXXYx5thvcdVn
 xNVA88Q62jzcOMwkYqg==
X-Proofpoint-ORIG-GUID: tMj85aghhv_pBOPPadzX_EY6_7Bc_AOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97408-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: A1EA7281678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> All the users have been migrated to using qcom_ubwc_macrotile_mode()
> instead of reading the raw value from the config structure. Drop the
> field from struct qcom_ubwc_cfg_data and replace it with the calculated
> value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
> UBWC_3_1 (with macrotile mode).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

