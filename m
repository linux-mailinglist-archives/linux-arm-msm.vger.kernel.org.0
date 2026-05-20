Return-Path: <linux-arm-msm+bounces-108755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFvrLc+8DWrH2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:53:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41E58F1D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F254B31AA920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B633E275C;
	Wed, 20 May 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpvxiULw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3w3/8UG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DB346AC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284494; cv=none; b=kBMkHn/RfivVAotKELsRl9ZD1q0OYY+Wml5ygOGTbl+ZQZcwp+bgcBLKvmCzE5Q2/NE0E/PRzExcFy7C7KkrDH/bLvKYimzT5CLD0W8Ie75MCFmu0WiK9W9it5h6wAnYG0y7L79vyijdRmknlBXcEuT4cyKZSqdo2ZQbxM6IHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284494; c=relaxed/simple;
	bh=DIzsHBFIcwnbijpi8bF31CrIxz2YCk2KzXL70eiZE8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yoa7IpLcnBNtiuyu6dQLErjQdBizPWOQSzYcVKlT7s7yTFvnm3/MZz2qBUe7ARb6fWBYsmzvP+YriYLy1YqnlrGrkY1DBtghxvAVtJk4lqQnhVljMTsvqd4xY4FQ4dKoYbFN5kIAy/VR57c6PVXKk8cgPZzlJPFxSQ17ba+yby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpvxiULw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3w3/8UG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nQ8K446560
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zve/zXZSQu9ewSFMNF1c0IzqgKRUTh4QdO7vTEXhftk=; b=jpvxiULwPOz82sms
	igPRtDxlFWiWqsSC6sQUYD0MvfZNE7nL50KYz3mmvEZjHoKvqKCLwM+kPU+asrse
	KAF2Jwr+K1m3un/1IMGaMH2YMpk7uTcYtxPG3rgKb0Gx5FBBnMcbyzXLsVv5sh4c
	hJHZDJHTU+awxApLAxVopnh3y/eK6LghsXk3Nqv6XfItXV0Trg+/gyGqKpUku3p5
	sBLXwmfzWCirTODCPneCqX+je3xx/sLPbpAZIIHaLp5cSejhfNB762hCPig5WTxe
	gWrQZZy3/I3+RMJid0SyAK+EJ+f25bhpa0uFaXppSVpCcvZ1Gh+3c0JUUNUtvqTE
	SCnYFg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgu9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:41:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63146b7289bso13847283137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284491; x=1779889291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zve/zXZSQu9ewSFMNF1c0IzqgKRUTh4QdO7vTEXhftk=;
        b=b3w3/8UGJMCGBfuhPIJ/XaNI/4nbJ2a9ZrV+87OPyip1pUFlWRzbFTKiSInnTMXhbI
         i1KMq+TYTp1M/ZR+cg39lIPOYvMrP75uKL+g/1UNrxEuTMbltsnO54mqrOeOVr0iZMKf
         xtu7nnq+jwtRQVAn7tRdn3sMF+c1p4Es+2qVcT3kTTmb6jPpeOqB25+5A84yFYAH5N1b
         X/3Y9TUrJVs69jw7HwrMJaDA9zOoEPPsUapgkHlXYVFN7qYu79yB9sPK4y6InYUFmPcn
         YQ8tDtQkguKgFHvhSaj8iqGafNk1K0za5a6XlRGshpWgCcHIQhMs/e7lFgTfFIhTSFdc
         nJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284491; x=1779889291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zve/zXZSQu9ewSFMNF1c0IzqgKRUTh4QdO7vTEXhftk=;
        b=nKDtS+KTVcJbOWktgyPS5MwJg80gYW9usRLNoEMzSIn9FPNo5zIehf/RZKHftqRMM4
         MuQcuykDQ6apdwDe9CX8jgLHrY4gBidoLQOJ6ruixEGBos/qc4jXdd9bprDN1voFXfid
         ehXH6YSFOXPs60viq+K6158fvRigEh/caJTFv1W9rdIqf50T8rPraS9/2kSTKR3crBg8
         quH2zxPilDxNzBAlFDyIVkNzkUhySgdQuYFNcZXvpi6yxzU33MpKvZiBcpzhUJafFqLT
         w5ZH4zBH6pjR33u8gdLugx8BtdQ9IGkCRnvhsFDEN5V+aurPBde5Bdw5LpsBrQfTVxV1
         b4OA==
X-Gm-Message-State: AOJu0YzC7EILl+EEao4eZvj52Sj2Y1nlUXRu8aXJISwyZPpEet9dbURj
	7yiYX7EP+pflUzK/rUVBDStnirAUN7jbnMaH7zWVubi+IO/VSoGsxfyl3jq0lSV0+6TcDVSTNyG
	RLs210zBTPZCe2WTsPJiXl/tO1WjNW8kFAR7tIeJZHYYd/8/ePZIccy5oJEOVnDFo5L8w
X-Gm-Gg: Acq92OGPavBxblQAjtkQ8SfY3523gJjWYT9hjSMUbwT0OeT9oS4HaBX+4LLIQZd18SQ
	tocWh4RL1+qjCTCpZW+SYcLcUX/eU0bHxMAd3iUa8KfFZkH+Gnr2KWxRxOWLwbJHoegl+6Al7qE
	M71ccOkVnk8eowIp/b5Y7YFU+jAGHWucjf/aKn23D+Vu14rw1hcjfUiDN1c7DhIIU3HRVrlRKnk
	ARL0EixZyiAf0ldnqYxyOLJy6O9qNpwxUrzqGReWmiIRCBeGI6fOC/kDzoLdtiyG3unMwuO/NeV
	LDCi7xHGXqLPj76JEzu4W4O5w6DCcw2tyPXtE962r0FNmtxB+XpWGRHCbWmwOEbvOZBs4fby6Vv
	yXS5h+6/HNd74lS+FSPUTq2rqOfVPD8NWFFmd/+FeP/Rw5GX5wLDUpFV1pwrCflvGvUPPvc8zG0
	wR+YXHiOPOFl1qUN0u9A3VkjxXLYFf+Jkrc0vfYE4Bqjo6dg==
X-Received: by 2002:a05:6102:c91:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-638b566d9ebmr11136840137.7.1779284491063;
        Wed, 20 May 2026 06:41:31 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-638b566d9ebmr11136825137.7.1779284490627;
        Wed, 20 May 2026 06:41:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm4997008e87.48.2026.05.20.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/29] soc/qcom/ubwc: rework UBWC configuration database
Date: Wed, 20 May 2026 16:41:28 +0300
Message-ID: <177928444223.2567181.6568362729287940658.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uSi0kqIqEVNeVlVbZyZ1__nobbEyLw06
X-Proofpoint-ORIG-GUID: uSi0kqIqEVNeVlVbZyZ1__nobbEyLw06
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dba0b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=siFjc1WQvlhzSZbc8bwA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMSBTYWx0ZWRfX1P2otrpMj3xg
 bxPemrYtsi/66lXY/5h/FLn6lBv0rhpS4FLgMVaCjDD3TDC5v4qKAdoexfrCnz3jDcRfejN9Y03
 FYJy8fhlJmtduy1FAlqtLiTelVsfASHx2eie3cMYXJMmgHrLNjUA3Q/f1e9diplNID1BTR8JB+L
 4nLUhFJH/IM02yuNhABzz3R8VTnkQPhoWAGzjuCwlEVDD2KOKuMLjA7n7FJ22jqJpkrB8R1mO+u
 hY6zi9DfmtjSpAGjQitjt59rnToZpkIRSg1lkqF4nZ81bek9e5f0EFYUvDrgWaUIopqcoeOIEFx
 2WqB7aqMdVEjeziju+W/axpVDuVvgINa7NfMEeMOdCwpGpnPJHSEP/SdWLnc/TVb3IN+NTSZiAs
 6PHkG07biQcXjsNF33prttV9++OcXQbbSv3KMs92y6Ga0FyexeOJj79f20xXDxKfjM/qP1ZZnVF
 6LJcvimrjpYb64MN74Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108755-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C41E58F1D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 07 May 2026 16:02:56 +0300, Dmitry Baryshkov wrote:
> Currently we store several settings in the configuration database. Some
> of them are incorrect or not completely matching the expected
> configuration settings. Others are directly derivable from the UBWC
> version. Rework how we handle the values in the database, trimming it
> down to the UBWC version, HBB and several flags.
> 
> The series includes patches for drm/msm as well as for the soc/qcom. My
> suggestion would be to either create an immutable tag for the first
> batch of soc/qcom patches, which we can pull into drm/msm or to ack
> merging the first patches through drm/msm tree directly.
> 
> [...]

Applied to msm-next, thanks!

[01/29] drm/msm/mdss: correct UBWC programming sequences
        https://gitlab.freedesktop.org/lumag/msm/-/commit/93e1290f429d

Best regards,
-- 
With best wishes
Dmitry



