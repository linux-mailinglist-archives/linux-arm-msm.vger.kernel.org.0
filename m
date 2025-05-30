Return-Path: <linux-arm-msm+bounces-59930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82350AC968F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 22:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39FF93B47BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 20:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F412820D9;
	Fri, 30 May 2025 20:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoZawHgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B620E6F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636874; cv=none; b=HMJXQuk6ZhKIFuq15aOjEIp8LZ6T8X/WCR4qvx69LNUXevEFshEyglypdKJh5TvFpvpm9nidHlvPru37L8qF0Bxc8Z7UfAJgIYKhV6gHCc2PMjaYELEY3sTGgWWEs08Xqw6O347oWOTErpKYGikZxmMBvI4AMwLIGHvEtN8oU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636874; c=relaxed/simple;
	bh=yzLs/F7IOX8OsZ82RoPOjGVV3J0Q5pBDHcSeYhHwVqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfWTCkTx5BQshvk9vNdL0zNHaUlAFKuyv1SUUqbO2puqbAHEDT9M38uLcr7hdHzeyOqfmvUshKRP26/Ya2QNPUBbwNKMD3YeBYnt2+eXZ293PK6MYtcCHMsA9ECI1O1mh2D1Gi6wsifsNSuOyCO+mZGY12UVEfVZxTcrkdGUeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoZawHgs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAp6Mq011736
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5v2/xYy+7yiHHDvsqhV++GxT3PiJTHR6Maiy6xrQ50=; b=DoZawHgsjojpUFwt
	SxU4H9LTBQluKMO/HZnm5sxe2h1vqOEFvx7Gz/9JuOfw7wPWD6h02kNcEQWibGVO
	NucV4bBn4RrJdVZXrULABC9+K+faeWvYooMJkTvnbYRU7K9y4qmmXHbXPxhYg9Kh
	WD7fqJkfZiBKGVUP5RK+ZNcVjXRho8vPppCM52clw7MBMQTnpp0ROCYlh1Pd4o3K
	EyUXftTZlmN8v67aefQMAJ8LW5UXSVaF6MhUmuUjMK8+/qVhDANozNqqls4dZcjV
	Ilyai2Q/NjehoN5dadv5+ifQV2m0w6rLZpJcO2nzraqKTuHF4LyCj5B7wXH4VBP7
	pHZZWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9agja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 20:27:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so376286085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 13:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636870; x=1749241670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5v2/xYy+7yiHHDvsqhV++GxT3PiJTHR6Maiy6xrQ50=;
        b=VzqwKfkuEvWF5Q9VbNS8zwboT7W/fADhBvajVzvYN/31/5PC99YomTQ479wiKYe1Bh
         UhJyXQ2kw1Gu0yjU4tCXJM1oF1OCw67hHjYccWmd/Gkuijb1SzI5dU/oy41fToKgKw0Z
         2EQpjQprbjIU+l89sm3mrpi3j4B1dw1jkmd7mYWywFBoqCYVI/3GqRJ4rkSp85WkMQ9u
         UkT3WdkrLK2+vIUhdttP0dCIdVzg9i0D9M7apSmgOyIlcU4NGkHTqb/e+Th090FXrMKi
         RWkO0+mc/RTOVxM2pXyvVnipUpINUSSqYgiXM80mHovJ1gRFQABYaQYCBvERfAM8AxAQ
         Z3oA==
X-Forwarded-Encrypted: i=1; AJvYcCUbpjl5N4jfTXCmGoDYVx2x3tj79dXssTqBo/KS3kDx82+bDQcAiTtXpygTh55B3tjqkfdoQUCmS+AB5GUo@vger.kernel.org
X-Gm-Message-State: AOJu0YzebGOt9S2QuYHw4Z3LrGwMH9OJPm2bj07HFa3CYr3WSAtUDKCq
	RKFlMB5Ay1KkjWwoXt8GFdrftWzAneAYXATC/V8Ya3huKKXEV66F2L6ju/G8tNGoV1yQw2XpzUA
	pHyoX1NeWn08cEA9xVc6SE2YOaGuxQo8hyddSCwBlaluv2IhMNSZO7ot5xLW0/+lv/+OI
X-Gm-Gg: ASbGncspa3qqPxCNwatlviJBnoCJAQFX9jUeia9e+unK87c9tqyNDh9SwmN0Nn0+Haq
	XDL2DlJMxhF5crFoiAyx6JUK9ZzzVOpZQtaPb8mg/gvTZ7A1lHmYwvQUakaBXTHuuhVTVDg9HoL
	kyUVdWLf6uuJOqIWs61KFD8inMXLc7NCut92ea0xYIYm0Kx6/y8QRXmTRv90UTCfmQRQYZeNc3x
	FPYEq/Mb6RgqYR3zf/85j9Y709N7Zhj0uNv/N9FIZcWDCIQ1mB0fXlXShH/Go0dz9J/ZlrMB+iJ
	gZwQvSwtP4oU/V2U8jFFx3xtuOGyXmFQs++Be2FCQorYCAUiKxpgJd4XPt2zNGOy+b2HAujbdm8
	=
X-Received: by 2002:a05:620a:600b:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7d0a1fb84a1mr641655985a.29.1748636870544;
        Fri, 30 May 2025 13:27:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJJZTqm6jwxr1YWdBtUnb7udcZWcz5bEinUQHIB1V9RBVrg2BBGhknwbIWpcoCnMmf4vwrxw==
X-Received: by 2002:a05:620a:600b:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7d0a1fb84a1mr641651485a.29.1748636870139;
        Fri, 30 May 2025 13:27:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cdcesm819614e87.164.2025.05.30.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:27:49 -0700 (PDT)
Date: Fri, 30 May 2025 23:27:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683a14c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Q_scCxKseVub0b0m9SMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5LbQFX4HCbSnDHU0_1sMO39h1J-lpCmN
X-Proofpoint-GUID: 5LbQFX4HCbSnDHU0_1sMO39h1J-lpCmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MiBTYWx0ZWRfXw490y9T07M/2
 WwaRJWv8yXLaYQo9JMZeWeX+1MSObISYi82UtSghqRO0cQ/gk0BbYB8GijnER0AcNIXLOBugOnC
 ss1ygAlDd1W/16El4DoaMlzL1fEES/vJmkJa6ivG3Vc9awjMiIAlyQUBB6eKi3FuAKzx7LBaheU
 NVbCCKhAAFIc+FjKEltAmLu68pqpxNyspAyCdQiHMdSjL/adWN5s1EaOIy6U80rZZq/3sh/vjnh
 PAgToyve3otQLvD6WrapHvwnrPEiDW3Ie5G26On9nlTxNzfo7RJA9Cx/MZZGhH3pDVzV/aTXazu
 dwcjRblwghkkKvK7d3EMR7woyeNuEscM47r2r8egphrWGo7YgKb8bap8yR3ELN+2wesBj1aaoG6
 kIQDmXlmqxBEg7qtss8wWoPrcyOB2DMhd5cpSQVTnShN66qOC0GlwpBbEhpAPZ53MlHaut1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300182

On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> QCS615 uses the same video core as SC7180, so reuse the same resource
> data of SC7180 for QCS615 to enable video functionality.
> 
> There are no resources for the video-decoder and video-encoder nodes
> in the device tree, so remove these two nodes from the device tree. In
> addition, to ensure that the video codec functions properly, use [3]
> to add encoder and decoder node entries in the venus driver.
> 
> Validated this series on QCS615 and SC7180.
> 
> Note:
> This series consist of DT patches and a venus driver patch. The patch
> 1/3, which is venus driver patch, can be picked independently without
> having any functional dependency. But patch 2/3 & patch 3/3, which are
> DT patches, still depend on [1].

I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
on QCS615 over(?)clocked.

> 
> [1] https://lore.kernel.org/all/20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Changes in v8:
> - 1. Add missing tags.
> - 2. Fix the dependency to point to videoCC series alone.
> - 3. Fix review comments from Konrad.
> - Link to v7: https://lore.kernel.org/r/20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com
> 
> Changes in v7:
> - 1. Update devicetree patch to fix the cherry-pick patch conflict issue.
> - 2. Remove dt-bindings patch from this patch series due to it has been
> picked.
> - Link to v6: https://lore.kernel.org/r/20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com
> 
> Changes in v6:
> - 1. Remove video-decoder and video-encoder nodes from the device tree
> - 2. Add a new dependency.
> - 3. Fix missing tag.
> - 4. Update commit message.
> - Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com
> 
> Changes in v5:
> - 1. Remove extra blank lines in yaml files.
> - 2. Add new variables in the driver while keeping the order of the
> original variables. And remove unnecessary variable initialization.
> - 3. Update commit message.
> - 4. Update the order of nodes in the device tree.
> - Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com
> 
> Changes in v4:
> - 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
> qcs615 dt-bindings.
> - 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
> - 3. Remove qcs615 resource from the driver and use sc7180 resource for
> the qcs615.
> - 4. Use the frequency in the opp-table in devicetree for the driver.
> For compatibility, if getting data from the opp table fails, the data
> in the frequency table will be used.
> - 5. Keep the reverse Christmas tree order coding style.
> - 6. Add "qcom,sc7180-venus" compatible in devicetree.
> - 7. Update cover letter message.
> - Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
> 
> Changes in v3:
> - 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
> - 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
> - 3. Put ‘additionalProperties’ before ‘properties’ in the
> qcom,qcs615-venus.yaml.
> - 4. Update the subject of qcom,qcs615-venus.yaml patch.
> - Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com
> 
> Changes in v2:
> - 1. The change-id of DT and driver are removed.
> - 2. Add qcom,qcs615-venus.yaml files to explain DT.
> - 3. The order of driver's commit and DT's commit is adjusted. Place the
> driver's commit before the DT's commit.
> - 4. Extends driver's commit message.
> - 5. Split DT's commit into two commits. Add the venus node to the
> qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
> - 6. Modify alignment, sort, upper and lower case letters issue.
> - 7. Update cover letter message description.
> - Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com
> 
> ---
> Renjiang Han (3):
>       media: venus: pm_helpers: use opp-table for the frequency
>       arm64: dts: qcom: qcs615: add venus node to devicetree
>       arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts       |  4 ++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi           | 78 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c | 53 ++++++++++++-----
>  3 files changed, 121 insertions(+), 14 deletions(-)
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250526-add-venus-for-qcs615-a547540656d1
> prerequisite-message-id: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
> prerequisite-patch-id: afd2dce9e6066b1f6ce0b41ceafe0dd47ad97c40
> prerequisite-patch-id: f8d64c8cf6cd883dc7bbb2a4ed6d5a4db85c536d
> 
> Best regards,
> -- 
> Renjiang Han <quic_renjiang@quicinc.com>
> 

-- 
With best wishes
Dmitry

