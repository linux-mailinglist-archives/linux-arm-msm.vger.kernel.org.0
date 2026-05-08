Return-Path: <linux-arm-msm+bounces-106732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKnFCYo3/mkroAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:20:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB04FB0B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4035300CE75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711EA3DA5A0;
	Fri,  8 May 2026 19:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5gglEjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXY1ca4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEC51474CC
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268039; cv=none; b=TgYs6a+o4Si3d9U+EpK19uzcutJDSRjE3+45yaq53a3lP5ERi9lq3YsnX8fpE8xNa3yTk8ZCADGBDhbrTfxH2rELw1cdn8YtIyuJZ+RW9bF8lbRsrO9oJSl15iowJ+zXcPKCxEuzrB59EHGRyb5KEGQl+EMtqqDdWTVBk+8xwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268039; c=relaxed/simple;
	bh=UAMVwWLPOlb06OiGlUHEI7yxWTDO23kLGEMFXjCn5vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdxo6osVpIlq48P5zqbLbXm7Xrl3jlQKuXQCn6PkACQGpn82P/aRrEnd8+l/foT6b2xZ4nyiczOjZsfiX9087km/YvUEAaTElZihPPX5u1eU6VSd9Kf9Iu/tzn4UtSmv30ktUa8XJ6dzP6Ocg3m7F5V6RTCFnn1KnXJeeX4ZmI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5gglEjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXY1ca4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648ClUYA257892
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMtQJYJVO2Gf9M/V1tEx2sOU
	Xhro7LsTOX7c9UtcKe8=; b=O5gglEjcEVXSpfd3j/yiolJPtp6hq8KO2hTF7sPR
	9sVRMaKQ/bwlBqlnnT/apkrzBTQyvNU3wi37SxAjGQkxTBmR4ExF9b/prHiqNSqc
	a4MoSrVjbM7SyH8yMaxttzTwQKTxHqsD99d/E+luciQOcF/UUE1migTltYPmcrUm
	k6na5Qhw0Kbyo+fsnVKiIZ/bUwlWpKDVQcbCSQc2VtqN2iV9CXxGepX+TlnLyHM8
	wQaDvw1AqNCHm5bY0JYdH5o2LjbKeqKWli0VALnSVwOAbULO1YsEe6oINke4ZyU8
	rPAz1YEI0Yef5r57W4Zjfg1IvBtrM5lZhMPPaEWZ+xTWcA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auejuj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:20:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631a49033bbso74915137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268036; x=1778872836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=WXY1ca4W2nzWExAHgYKkKnDqT6ZfLd2NZq1WJ9JVXoheixv9EI9JTSGejsJonoVRI8
         Xwi7u4U2n3kdppOHZmSkOxKqeaWzqR4fY/P/qTn2CS1WXZV16akhDXwS0hvYfpM5ca6L
         Ol0GcZ4CEKtIsQWjT2ey0ARByRWKwJjI4kTPURN9zMzYFep9d6dBqF1EKO0wDyBUj+Nn
         u3PFNzdW8ByXm1wlZdEwre/r80Ve5OqLsffRW9AqDWXZTfc9NJIX+MIZGD66Fy/8chLO
         V0+2pMFJ9AFptnRtPVVNqKEhHjeebsh1YSixudTxcdKj7vnrIgFsWQCKQmYx1tE89nFm
         weuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268036; x=1778872836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=mOsNEM+QmgS5NyfXTxMPdd3krUGm5uR4BKefz1ZBbSUbnFy8RiKmZhgI8LhR5O+V7P
         +em+5AxL9q2gNCmWSUVjwP86MYN93Job1DFAqRmG1ozVWyvMq5+D3NVL1txB8WzavODF
         5IBYSfyOnH/GZS8GzpTLQD070+cayVseQTj/Bkwdaz2LdiGyb8GqBr4JkwxGp2bfH9ef
         61UHcIdw/B0W1RTmqJTwm/B+Uku0Ky5ixDA3rmYEppqk5dOtojXvZAqUTbh8rKGSSGGP
         RFH/jEQDuLVqM6cM/KS2MiIPSq0nQ26k6vGvw4YnovAA+Zyku4ltcYYEpmG4HPqNZInw
         L7jQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dTFrzLERNQzL8LZpEs/XbJsy+jJKpa30E4+txPyHZSMQ1S3ai+Sju4GQQoeub4HsWmi9UuBqmAa5I53S6@vger.kernel.org
X-Gm-Message-State: AOJu0YxsT5mRpQUolFXIH88md7l26EMX8azAPkIJpzPpE/orAyAPQfy+
	mxfyR7e4gWYvdZMsZWA8XUcobc1SsPAYk3Yw2BxxEjmZYgyY0x/o05xetmHzu6WteUkzY+qPA1V
	Z/cfONuAN3LY6j6KSngo/RaRg1KbOZjsE6cKeb5DI3dJOWbERTbSH1wrtRS5lhnru/f4+
X-Gm-Gg: Acq92OFNj99wI22a2gb9rzMp07Ldk5RoYfKa/KLeeZ6/eshyli5xFi920NeDiolBsiO
	kAQa1Z69g6cDDb22JWIAGT2ZvvyCffJQT69uLB++iVsC50kUgQUIu8syWjhVwX81YvinQF3esvt
	ElSxP+tsPwsG6j9n6ifzIBzD9k5ktTJJx7yXl+AZIGt4WqHEuCGGc376yI178PD4/fbon+UY2S0
	BycZ3bgXQ8h4QF6YDjI9njQArGvyhWLB1qyvBpMahDpLVYRFjTy9yBmyKO9vzvaybQnqt1TYI5w
	qGvTIjEG6M1ThPRpB4HadGB1eLJQeMFmhi1vuskO96YXXiKbHQY0vOjKFEBZ1rDdGcVAKBNE1s6
	8T8otfDn0bsb/QnHojzBijWZDAt3OnuGCZ5NgXKE55BnvFM2lBVhaDeKce8U4TTqUWBHCnIk+Tb
	BmeOBHdccaaeW+hcXRmMnEC0rK4zyvEPMUoB8=
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365907137.17.1778268036292;
        Fri, 08 May 2026 12:20:36 -0700 (PDT)
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365894137.17.1778268035868;
        Fri, 08 May 2026 12:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951520csm747036e87.15.2026.05.08.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:20:34 -0700 (PDT)
Date: Fri, 8 May 2026 22:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX3VVbBQHYrI2I
 JTgZPAQWdRQ/LAZ4bIGiWQb5ktcDwQI3LKHwtztt8Zh4ZhKWpGCb4FbTG+1mM5FPEwcsi91p3Dn
 K56iboEXGqO8N7DfKXGpz44IFtqOt/rqb/qTkVii5L18p4PMfQk1xtZtL9z8CG1zP8Wq4Phb1YE
 +o9YK9TLaYlw9uQF96go2h9tHcMbTnrbO23vmDzSs/WTz7ock/JD0nOLp2oKoaeB71D4EyuCuqv
 YLvNsLRnX2aNebAWJ+V325hB95fbSQar35MIhWMO/lE2X1qMM62uO2GgDVjiVPS/5siqc5C8LS4
 LtAVwQ7Qn4aqauScgl7FjeXyodTgwFgcUQ7llYoWAvZQ1JDIrHIKIbfHE4SeTm9s80DhdsXveDR
 cNmlyyGmf/fvj5CjUnoPamRDT/kA9E35avg3cquAfs3TOYrzsfprynYB9Q7lWzXoxERyL2yv6md
 XpMqjECNsSEIYGrsx/A==
X-Proofpoint-GUID: 17679bwqbgY4iwFYQ7_xIsUHVJpwKitj
X-Proofpoint-ORIG-GUID: 17679bwqbgY4iwFYQ7_xIsUHVJpwKitj
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fe3784 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lCV4VpG5okPm4yurM3MA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192
X-Rspamd-Queue-Id: 79AB04FB0B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106732-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.

The explanation is pretty suspicious. I can see this write in venus
sources too and it was added in the initial submission, dating 2017. The
driver targeted two platforms, MSM8916 and MSM8996, so this write
predates Glymur pretty much.

> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 

-- 
With best wishes
Dmitry

