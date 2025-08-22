Return-Path: <linux-arm-msm+bounces-70352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B66B314E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516F317D7B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D822D4805;
	Fri, 22 Aug 2025 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5OH58iB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FE2C029C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857659; cv=none; b=akwr7NeeCID3tfBqlIuyoSJLJfcaYrXnp3jW9pu6Po06C1OMHnZkxg0xb95h7hxzIk93x5n5diiQ7FA2dEX7tIIuvoh2CslQ7DoLcW9iCN2gwHYAhBE009ZOPhO1p+Jv6ycem9hd9fBUSTzKu2USJKRH6gniQxztWMoGQ4wnpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857659; c=relaxed/simple;
	bh=n4XlHGSeVV4u/xbLlWPIf9uljQMpisW4a0en2tZ2Heo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7OzyWuHSXZWDXWRwfTU8KI1spuUUb2TWZsUFTlv+86Cb2exbs0SwFhzXvWWYQl9bBhZ275jVr56FkFBIVbBIQpmSYxI3L7EXuiJmUrkdgFPyYv7BQDz1X8kLoWVmFtcVHG+h0XCugSjerZa+l8pgAUVpzN6o+XvaTzOisGnH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5OH58iB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJ8i024112
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJJ4C4c1AFbf34ScS1nOa6Ac
	tdPWOXGtr4HiQq9bwqc=; b=R5OH58iBcrn9G871ea30573DuAaYzeeW6CpwHJtB
	8iWmxl0RNsJSom9nWbNnAGviY7GKRT0MyAPZACJkRZtwokhI3047U0Vx3tGXrn5X
	oo5OvjLmF6ABdb8Trf7Xgi4v1VBSTD/liJfoCzQOvaaO+NJGu9YmdsSF6FIXQfPh
	t6cqfxbf10MY72cTI0C24GbvNG7xPaRraeXS37cKezv2gyLg5RIPRGW6DfK8ttLG
	8iJ+SK034B7fMcCzO9EvzEOV20Lk+FSeades/CpmjJ+1q1fxspLO32I07GZPaZyf
	PckGKMZZroSnwWenGoq1M5plGvnrrgLfTAHZkDD/K8fqJw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agwg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:14:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9eb2eb9bso5061066d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755857656; x=1756462456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJJ4C4c1AFbf34ScS1nOa6ActdPWOXGtr4HiQq9bwqc=;
        b=irG3IEKdVn1VLRKNW4k4N1zNl/y1KKrAg9ALuvZKFecn6QdEawG7uCXLekbDR3mBB5
         ciTxMFbpZCj5bPxF+m6hs0wNo5P/MumilVnWnvm+j01DpH15LZOkKz2EKptd0za6uDTZ
         Wh4NpVoNdTz8waDVg1LjqhNdpwEeay3OTsWzYPT6HEvI5IJDnatb5LuB5idOxVq+VHr1
         bUN/N3E16LY1XG1gV0xw+V1y4R2dNCe5waQPV9XYfRRbZ9ioUy2ndG6gx8GDSqGxQBCM
         Ni99l/0BzvzHVlwKLrKduVf5TI/ujNG7yWQ6OdUFPV2GMYpEkw5782HvVesDjdmDhTUb
         GE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8KR7F8PFPIweB2TwNC92ISpbpt66XMGQ2e/MtnD1F3SpWZpqeA2Ge7X+kFIbyu0kwwptYat+ACGNscc2@vger.kernel.org
X-Gm-Message-State: AOJu0YzInvxfV5+KWnORI0VZ+3L6eG6XxCD6sdL1fUSkedHBn60oILf7
	o/2YGHSbS08M28HIXqimAS3GL+DrSE0i/lgC/d7ErbCuvlQTc47GVWeigTn+4VVOzpgT6VZUyGk
	rnbmVTVFNHUiZY1iA7lpRfSpqgm4cvYkNn8Q8qGnoAnN30AbkOpkCbBts44qA+lxv3D8P
X-Gm-Gg: ASbGncvKhMYpZcptzXT++joT9Li8qdAkL5x4u8a0XXm6z1hlML6l3QdyARpOFuh/1JO
	Rj4zjee0iiVWu/DUT1qoiHYHkrrsBICoMAbMA+W9eRxlAC54yo8T18AwI/uRLlDy5ShJTczIQVH
	rghDcdXHDMfskHh4va+kG4A/pRrut8v0LJjDNXEShHRF+Pkwre3Z/Pt7cE12PzQ85qrdjd4EAZT
	JOVmyNQuBQwcrIAZbXd2OHEtobxfJsC36MVv3JKK0klZssPDSy6Tbk7bv031ZjpCFvThgCBEgOO
	S5rnSigZxbihyc8LgLMDi82Iv3sNYVXU8nZo/warHqanKVk1u2pVoFzvztWkfuNzv3mjn4ahP6c
	xYgpzsz7e1wV4hY/2wH5cwFDpBCcPQx9zroJOpcC1/A6jRuOVQ3jp
X-Received: by 2002:a05:6214:411c:b0:70d:8aef:8d0a with SMTP id 6a1803df08f44-70d9723d63dmr28732206d6.59.1755857656279;
        Fri, 22 Aug 2025 03:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvj+OJvL4U4ICh4U+njjBOvCBqdT8JPERhEDd9yPBFxhlUitzuVfVPcNlnrlKx+hna3vy4zQ==
X-Received: by 2002:a05:6214:411c:b0:70d:8aef:8d0a with SMTP id 6a1803df08f44-70d9723d63dmr28731856d6.59.1755857655703;
        Fri, 22 Aug 2025 03:14:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604776sm35600511fa.47.2025.08.22.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:14:14 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rpmsg: glink_native: remove duplicate code for rpmsg
 device remove
Message-ID: <54moh5c4s4hssl47tabtlqm5mu33frf3x4k3fdhsrlc6abfltg@n6igz6vf5yd4>
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dO3ukui0c5VtDNdXhzMiM-dDrmpn_WON
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a842f9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iW8-pYDVSSCBICfSpsoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: dO3ukui0c5VtDNdXhzMiM-dDrmpn_WON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7NJfW8rJtCK9
 CTSOPDTUu0tCynpdgqUx1l29unLXA9paNRnd68epkW1ecX7IGBtbhTKjTJ30puAo4MKP1XHarXF
 veFnC1SmwUi1betEaMS7E8pogYH5sRePH/AfJKqiK4sVVSgT+lmzk3RYcBPyvL3fHYuN3KbT1nj
 dd0Iugflt4/dlW3ooIEPo2P5m60Ha+2JaGv9ExTY9DFrLoG+VJFkqVbzpNKlCzcfk+UQ9sRz1vQ
 qwEgG3s0ScOU+JhyU/489SrkHqceCkhvt0PFxzyblKP2DtC2pr3KeG+ywKdi5fFSHkFNMBMuE2g
 RCO4fu+4XKrO/QjoJ1TZ8on7CishkRBZebdf2lftZI8KzS8V85JAhQ85HfBQ/CVpMWBYcksVe5X
 ILGbAwHMsRe99KBEF/usUvCSf3WYCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:00:43AM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> rpmsg device remove code is duplicated in at-least 2-3 places, add a
> helper function to remove this duplicated code.

I think it's better to sqiash this into the previous patch. Otherwise
you are fixing the code that you've just added.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 43 ++++++++++++-------------------
>  1 file changed, 16 insertions(+), 27 deletions(-)
> 
-- 
With best wishes
Dmitry

