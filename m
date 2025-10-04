Return-Path: <linux-arm-msm+bounces-75961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F302DBB89F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA753A10FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BDC222582;
	Sat,  4 Oct 2025 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTL4R9Jf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0BD1DF970
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759558812; cv=none; b=KY9GdtM7bhwDGMl3J8QfwanY1sIYZaRe6lybILF5mtQZYpoKzxWBtFhJwGYh8vj/iKtkUvudO+hLjdaNbDpjJqhEcVOxVJ8sB71OTnu6aAIGVCq4mZPKFbtoOTsyyk1Ko7xYA+S5EnThtM9+LYY39WzVKl9rJqqpYhqXznx8SVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759558812; c=relaxed/simple;
	bh=E4TpaqU2JrKdPWSIkXzozlfkEfDOp9hCavV8plMCWXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDYo7h3ITVoStjdWiaDJeHjkUDfxWsVXa11tuvm8QOuuvk5RFZuEWoPW43EzEWN52+8QoDIGKf6Hrqy4z7nRzVAiRwMNvzFmnPR0CdxdhSodVpcTJmbHoBSMxMUdMomALGmKepmyyHIfFnSjADpiHHb4FjqJb2IXxuLQlUrtEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTL4R9Jf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5943jX8W001689
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Oct 2025 06:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8m4k7jTFBedu+wLB0+uZwOmi
	JaNTVqtHpAOlLIi7cx4=; b=fTL4R9Jf0MrmZ6wcWUb2QoCkcsURGAbXIo6uUyFh
	z0CFCo3eqqzhyF1X+DX6pVXLRBY+VBGg61MzFXs5ocqPfVVdLPhzwuUAP3V8aaf9
	dpJ+PN29CC/zhpg4EaGdVDzCbtc/Dl5/vY2h5PHbLGzxce7lTHpMtjpkQIT/tGNM
	aEZO49h/OwzEgyGnyOjxynMXIpu3xdlCfN9No1vISuY8mz6hNKHnW8C+juPXmxzv
	99c8rVMIrRfBIDT679m5p7VZfOuc3AtvS2maeRkHvmkijY8NBpNwmDKFeZ1ySGmY
	+ShMlp201YvYmIhyC5ZYNa7B917jCdHISuaQJPMSzg3xxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6r5ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 06:20:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e1f265b8b5so67453671cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759558807; x=1760163607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m4k7jTFBedu+wLB0+uZwOmiJaNTVqtHpAOlLIi7cx4=;
        b=qeUndX4rc3I5AMtjR/Atriem89V4SYYMyNP+BzQ/+K5UGrx0l9WNhZV+SeMy12Cq34
         G6a017uxsVxUmDGtKCYt6tiTVcXjcCwASK4LpGgHPyPvQNua6ZOhq/kYxpFhT602dNDj
         zNkOlfq4GdMsb+BuF2gUMfbmlGdaa8oiQb9YN1uHCT1iOaZSNs3tVQg1pWcb9P3VSPUn
         Nxa3khy9KunS7+aIh24fmMqVblerm6YvhRFF/9p+efUYa/D7z4i1G3PUjfj743ktHf5f
         EFXPQQpQNWDtqdek460f4R2DX+Pi4H3sAQS0dBknHtgeTAcsy6KEpg0O1Ag/3iMSNI6s
         gJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXCYv0+1bh3dTZwO3tIiCU7QWTaPWtdasXmvgpYj0ATh4PU0eQ7Jy5sGZGXCjoqlawIqlTWKRGy9pleByHU@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHrEVt5vWsoH6qQe0PO6+HMLPyEFU8Vp4QY/DaLsFwbpZzKxp
	3GpmLK1ZVrrRS8xTg9zNVNhM+2vYD1lrxIogAMvLDH2GE7QrgtJyBo96A8JRkNSGHlKwCcA23qy
	6aW7NQl/l9d3Z4e1vdH8JQQPJ+nccQjjtIzyPh7dbY27+WbpE4OixL3cBvTFvIdlbn3jG
X-Gm-Gg: ASbGnctSsqanBaUY4oVtn3PTUlr0y7TPd/tNtsOaQFOUJeDPQiZd4lpFrApFdKGyXw0
	mz4xiQg9hhBdgOGGkMIvz5IlptBi7ECuyOnIwuBX7dAghkYyXYwYWdWZS1l3A+2SRDxanQbmXFZ
	cuvwXjVW8QYInHivthpScBYzRBoQG9SNcrfvNktm7hlFdKqzSJlM1BEM9Qo+WX7Pgqqff+hppgg
	/zdQIEM1eAy+qgSbB1I6E5c4nTZ85qxFKkUlz/cVs2GQK8W9W4abhB8YaMp0iWzjKi61nuzM61o
	v/5XYGETm7+KdnzAKJEdMTqtcK1B9A+/yMttyK3uTngmIEJ+VMF2YNkUkfq9x2XjOMRvun7dPm0
	y8D4cGLAfclgbvywwLfdh/Xr4m1dx6JdLgQ91HFL/zq31IrjLQA1fNsdeAA==
X-Received: by 2002:ac8:5f96:0:b0:4dc:93cb:fdf6 with SMTP id d75a77b69052e-4e576ae681amr63138351cf.40.1759558807473;
        Fri, 03 Oct 2025 23:20:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGidBRK9vwwuPbw+sdHnG+JGdSaIpFRU9khv8BmL2+FlZ/ApkKjfg3yG1B7zJPyfdzHmKwUtQ==
X-Received: by 2002:ac8:5f96:0:b0:4dc:93cb:fdf6 with SMTP id d75a77b69052e-4e576ae681amr63138191cf.40.1759558806948;
        Fri, 03 Oct 2025 23:20:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444480sm21486421fa.30.2025.10.03.23.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:20:06 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:20:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] interconnect: qcom: sa8775p: enable QoS
 configuration
Message-ID: <uscvhnjlqfppfq4gh3gkja3hww5ldyxprbetqzpfmb4753v2ek@76w6rck2r6gr>
References: <20251001073344.6599-1-odelu.kukatla@oss.qualcomm.com>
 <20251001073344.6599-3-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001073344.6599-3-odelu.kukatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e0bc98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=sR7M8zb89NgoQLAwK4gA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: p74v27CUX9og8eoYiid3UzUcKy0w3eks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX88Z1ugB6LuTZ
 N1jcwYeLjDam0JZ2cE9Lb2bzizVGrnNZqz0shqYL3RDgJEMW4ogO65wIG5bP56W6NDSu1XY4Q0P
 Ai9N9EoznLuNXxdMtfiCCk3ehL6SIF3TeZqCRvsu7Ikerxn0QjilIeB1LG9a8N19Kmfw7He9LH/
 Vsnw9+8gMC1nbYqE2HgF+eKl6/xagMmDovSWfqICNI6khcTzwszCLEfiCk3bYvYPpm1LRW36DOH
 wkDuxGrHmTPoVmxbrQLjGA4+ozrzsIqVSlx07qm7VB7o3lRJPxPrTv+C/fGU056C+eo2UxUVPiN
 nu+nlPynUS80H88niK0uaowGYl+P1c+yJLz3KgQ9+ZW2XzsD9OaDYCbGF6SG979uQZoceLK3PF0
 MRWh3RJDisNJywTDeTS2247CDTpzXQ==
X-Proofpoint-ORIG-GUID: p74v27CUX9og8eoYiid3UzUcKy0w3eks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Wed, Oct 01, 2025 at 01:03:43PM +0530, Odelu Kukatla wrote:
> Enable QoS configuration for master ports with predefinedi priority
> and urgency forwarding.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/sa8775p.c | 439 ++++++++++++++++++++++++++++
>  1 file changed, 439 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

