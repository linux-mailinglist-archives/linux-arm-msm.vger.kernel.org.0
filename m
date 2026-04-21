Return-Path: <linux-arm-msm+bounces-103914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GlGC2tJ52kh6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA64392A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 919A630374BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562E93B2FDA;
	Tue, 21 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="df7tAtBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJ8ngkBo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA63B389F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765079; cv=none; b=dvv98j1iIdqIjQKNLNaAGRs7wz6kCM0jIJZHBaMOEn4ok37v30dmVStU+o5XJw031vUPxcGdYcXA5yfEYcPhJlVva/EbrEMRoupbCQnjmQ4CplVcXGPX2FpM10p8n3/p92mFir256yVDdX22tU9NPvQ+q19gLGi9TOQYKh4wO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765079; c=relaxed/simple;
	bh=Ojw+RAOzbTYtLOjOifOUWKVuDz2VxagOdy31gd+RLvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcSf7yGDSk2GYnwDm6HVQsHeeqUdMfedBDpMW5EOj61jEw8ADKAGGB3tD8ddx1wYXvxf2ikCst2SUs2FGlkraaUITDNCt1xdfUZ9w0lJOVwtzB6t2EVh4rHIugZUsyaLWa9UAviNwHkYEWgTfTN2yN+AJfHX1G3mAQ2rBETfMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=df7tAtBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJ8ngkBo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ePc63574133
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=; b=df7tAtBNSOEWW4QV
	PYh+L9tHKd2hG80sD0WCzKbTf+PwkzNyMtQM+WUZnIb0bFLacmUhKm6B2Feg/owB
	zYAsr9IYG/aIzInS5zplrETdOCy4LmVtvnF8d9eho42WfPY0yoWjdY/S5eT9FZ9d
	PgwH4os3tew/ZaDiDZPe0hnMPXAXfKpNrG21DbT/lqS49asRON35kJKr1yLcVKqt
	BUcdXmgVeqNsc3g6lQn0vzl1boWOn3kG1CawRExKwexBL3XO8DniH0pMLIbYJNk4
	NQlY1Kg4KGs6NlJmdrH1KE28Tom4U/l3EZWmME3jkIkiaYw9kDeELJMnwiFpwRSA
	aBWquQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gqk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:51:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eec753a7bdso8608885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776765073; x=1777369873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=;
        b=FJ8ngkBoi01L1qJOS+hrVR/XL4blBiz5CbvSwJOXi1wAqMID8aMX/XbrujrzLIZXsa
         lV6cRA9CjQ8CUcxJGRj2DHSDFDL3Dqkw5xpopocaNPCOe6/FuaHgESOgpeNz42+z0EmL
         LR8Xp68pWf5uACRlh6wUdOIrri6sbZo8r/p2WJWT7eeHMdlpqaqIO34EoUBkASf3oqhC
         B+jHd69S735qeVkUqQ7iPCpKO6ME/R6BSBqx9484B0I2rlynEYnr+9cAbSWHOc9Dpr9D
         8pD+gxl15tm+8QOtqIYC0zjueWgHwP0b8YuP+F8iS+HjO570M6KlhnRTUUlPvjluUWzd
         UF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765073; x=1777369873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=;
        b=HJMg0KCpQLQaKfnvqMHy8iLvWc4eeYAALDR6/tGrP7VQt5whMU/rOhwfV1JX7YwSvQ
         lVIFWPh0L054pMCsn6T8NkiRCZZ5z8c6pm5Wp6UZgq3KnZVsVFnVV+4KnJ5skeQV6vJA
         GY2c+iq422jeEazk7OPvnGeDR5shdzFBFWj9zv/hpXA3W0kEkcwGGnD9+3KizTohHXhT
         F3ksDJ6Q1wrPEzKrWnbONjs2jKZ0Ujoi65Crn9Yjdtpev17AOpN3sXKHIAVBbCNl/f7V
         VW5dOaXIV7P0vCzM3SG9P5T0/ZJ1r8paRM5YgKvrsOUGe/fIGQ2OgRyB6EAdjhEVeroy
         cFdw==
X-Forwarded-Encrypted: i=1; AFNElJ/MlCkEwSa5/HswjC+gS8emNPy6HVCfiWa5h7ye5TRqxNpxludQnCWxUNE26TSwWGb1hpXElpS264plGsZf@vger.kernel.org
X-Gm-Message-State: AOJu0YybwRdR7PbZiMbeslzi39ThT2L4MavjqqpruWLsnzXX6S4nFhUT
	zZ4amG6Rzn54DEV6fOBY68AM5HoAiZUQ0+Ya0xvtijrrSHU4yltEsO7VZxcq4JFI1wyn4fSoogD
	eUaBwb3vojcuJdqAnGUk0j7q0COsqS9WJgm/mvt75sJ1QkxcZMtWh8OFeRgCEYaaHnz5B
X-Gm-Gg: AeBDieucECn0qmmOcV0GZ1r2DVuJttgdmb6YrvMI7vlLfWWQ4Rdx63JLgPNmaOQ3YZ3
	C5tE0Wq6WS4rf/puXUDK3gF6xBRdR33vbdCvZklib6svnDBQxh4KTtDSJtH4p6H/g/viTsMEJ1f
	mQcd59e/i2wn5QT4vdrITPO/C2RNXbcV3HW3/m13PYfZN+te1IDxMNsH8BZhusM18GHVeMktVsI
	RMZTWyoIzeyRLg1vIyI3NSdcPx4snMkcg36HfBxIXDBoNB+1O+DatHFZ4HOCR/P4zzXh+BQzXT1
	aX7VMyLYuj3tmvhpuQGxxCYR3+RuFjG8VFfnbS2vqDrLGH7u1JQ9zRdQMitxkkxI7kmLJHkavvV
	9E1int9DaYF4bw+Q/9gVsYPfs4FCIGfvg3VeldNHKRcNpn/plfq86DtlaYIW3TnKuNmHexXyxfG
	RuftJ391QZHT7viA==
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr572411485a.2.1776765072677;
        Tue, 21 Apr 2026 02:51:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr572407185a.2.1776765072156;
        Tue, 21 Apr 2026 02:51:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e22asm2692461a12.9.2026.04.21.02.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:51:10 -0700 (PDT)
Message-ID: <b340dec3-8c4b-49f6-89bd-61a8233bda2c@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
 <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfX37mDWywtCsGo
 QFCv5LzX+hlDH6cfhHTSJHUsBpQuBrz8mhMLiViKqXhY8k/603E4xfvWunZqxK1mBkgcCwX4Gyo
 fWYBr+f4L0IjPiriI63Cfg96Sq8oJu5DXWHzl+rr/dQJYS5ke7jFzAYw922LF5nuEBMdLAVZhvI
 Ro/+d9qsK5geh3+0DonAIfpbu8/tL8c6n1XwKHZXyEyycIColQhyISdJMW332obesTtcYbqbb4A
 PpLW0km/Tf9idzns9l+/YusWnRJf03g2hmFM/Fr0reA8XjssEeQ+dbK/x7lvyShyzjjN4Eq3T7/
 g0+s4iLcVQ13QlTpA1UWJPfkUyvZmzyKXKMGEdP0KDqaJkIc8kpO9HuZKjZEhkSNuCnbnGHMt4R
 i13qSzDvEd73iBwt7yZPy+MZQmjWAuHwIkq/7jOWC1508XqHPqosvukyn/zGijZk6S3PriNauHu
 NNFmjfVvdgBWIywjoeA==
X-Proofpoint-ORIG-GUID: x88lJ_4ylc_yIH9_8ivvja1Cs8xpvTHI
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e74891 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KAErmEmBofBSjU3YeWYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: x88lJ_4ylc_yIH9_8ivvja1Cs8xpvTHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103914-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DAA64392A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 1:33 AM, Dmitry Baryshkov wrote:
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

