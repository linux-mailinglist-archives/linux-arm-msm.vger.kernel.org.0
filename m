Return-Path: <linux-arm-msm+bounces-88234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C70D082D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2833B3021E46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC643590B9;
	Fri,  9 Jan 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+v8eGrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpeSZnoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38D32FA3D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950642; cv=none; b=epz0+N6lc1meEJEirjWBLcBh+bCu2Dd00WVGta+ab1CYNj3ZUuOUu4unfL3mzBW8n+ZH3zA85AlC3RAn/3IuYFBBCLuoxyCVWvbeejfS+uOse+ONcDZuimemnplxd+GsT1qKHT+wY0iz2rfv35haBUFrL6tNpxQC7DvOCSryYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950642; c=relaxed/simple;
	bh=QnO3vafJQJGaIA1jtDwjEuhhYiVL/xoiAteK+xieJIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJgROMrIPqSNQW/Iy6qzax4nYG68ILQpopt/NvHeKWIehN4UU1tC2JIMU0tD5o9Qp+OEkLjtLEPcw7UIlwtT6Y62xT8xsrVUO//SAPR8chXrtOqEl8dJDQN1zmSjwMflnCMFyKNzq+zDHWz3vyMpLzd7LqKmnucbN7i0m1+bX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+v8eGrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpeSZnoi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XNo5822710
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AK7IfBbhpAzWs+eHOyk9nbdk
	oxstTFGESPbDQTci1eQ=; b=N+v8eGrYFoV8mMt7Uo4yB1DAl0wGgGHgITi+CBuC
	PHqyQXIZlJTMfOGD0Z4fEJh8cjZ6qavhmeT3zCaKb1qRCyzg93OIvQWZy4wTvC1i
	5UFU58SqgmuS86tas/0ARoVxfszlKgh+/0vYYIkApILP3NxL9OuA67Wz1XxyWixg
	r6yhEUTfCnHn5zKXuFcf5nSCd0oMRczJ1aa+ioQ/ifzIXarzaUT4llL9oyLGg6+X
	uZkZbI+imxfzJCxbT6nwm8mdp9I6PxIODkGT+i2dhGl4VZTZQVJjVvVnefI3S7nz
	C0kiYznU7SRt+xoaZxE0sB8RM5RZn8nLkMDlaf8qk9RtHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94g5uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:24:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so611987785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950639; x=1768555439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK7IfBbhpAzWs+eHOyk9nbdkoxstTFGESPbDQTci1eQ=;
        b=ZpeSZnoijWlwNj2/yP9UUroPhRe6vI88mlJF2tVpYFgthlHNuzUTu0vQ3VfZ99Bsi5
         zPt90JdKLfxs1aHVKnhV+KUBpPVwmxBGRzgoK4vCODEzsGg25nRjsx0JOXL41sURQ++g
         Je1BWk6HcJyNXTyw701hKdcMgv5ZPTsgToOOZaaDQTPX5xSQFmlQnhtK8F439MnfcJWM
         vKIo80Ug2kw2xz6+E+Ig75JBLMrHBzMeztlKctJQgxbb2ojVADlOMC0L3K/R+Ab8koQq
         fsfchq7OFWxJubqVxAMK6ddEcdddbYlooaMqb66568Llcg1nsJo3EXK04ERuGieGLht8
         MGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950639; x=1768555439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK7IfBbhpAzWs+eHOyk9nbdkoxstTFGESPbDQTci1eQ=;
        b=oqewWFH54YfeHdLRCk4MStP0SXaYrGyKox2T3YNeZNDmqLAw7e7OxHfo1DmKBnq8P+
         KeUFiXsiubZnDdBEFfVCDUGtmL8RE4WucoQW/lNjs9zoneNPKn7qesBid2bwYe3WHFJj
         1UT5Mr3zx8827jS+joauxkUJHZXC+RfufeLN/QgaVr5hf5YZgv9izp1YLgog5cpTalIb
         PRCjzN/lt7q6QV/CNnX3BFoWCzlJMLbxAp12fglUiNtvcsyU2cAfukWCx8snVE+d5PRc
         7Ajk0uP8xvPDHyDGGaw3U6ZbyTKXKKUVZEBZ+Qw1kA4wtmfBVLUKHUt/UoRa2aKMHAB1
         qo0g==
X-Forwarded-Encrypted: i=1; AJvYcCV8pQeHKXW/oM82ePLrV3O/MNfGvp+5rbehWPvu5AGWXfVtrS5dTYzYa5mjDzpxnrO8tJybmHp7edVh/7Co@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsb0XWoo8bOai7O1AE0g9IEmwojUdy6Bg217OsOCKiGk/LaX7d
	zVm6ueDRQ+06F9SCoZqjS4KewsWhF9SckOKl+/CtnEqrT/R3pFSRpW9K07RGAZA3zAsKMBgpCxo
	y/jIHGPY7+8fOHhVeCBmgXcS4wd4NYSUCn8qqFV0PdJ9lA8/+61nyx3yctQxxTWaFRqW+
X-Gm-Gg: AY/fxX7ikNIz8vl/nNImLnobviphJxvZ7eHUo6fbAI2A2SfefSjDre+2CS6gZIIx81G
	H29zARnJSnYyRQtkxw1vwaGdaRv1boKDaQ/+ZrVLyIqMe3GhKXl747oBDJj1poqmlWnD5W6FhUQ
	Z5+Zcj7FRV/jzrvlzvixLqyPbYx7U7rXhWgeTfgrIWGejz79MYEieVl6oAQHvbS8tJ5yprSucq+
	ztfUcUVOXLQPQx/R0RYF2mr1rfLgNNH2IJhbbEjPlgnS3r/i9k2zdONvFnkKu7qhAkMf/cckORr
	/rOw/god+P/zjSEgtBfGA2/f38VWBSNL09l0aE8fTVIrEzsysjv0D6kY2+m4xUj7u+U8PWWKR8J
	WllK8N9Asdi/o0zNqlDru
X-Received: by 2002:a05:620a:198d:b0:8b4:3ea8:b30e with SMTP id af79cd13be357-8c3893cda6cmr1078784685a.46.1767950638889;
        Fri, 09 Jan 2026 01:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI6OfjXanWsxM7KLDg+XebpsV+j+FmvT2Ummhbd0A4KFExItoyKxVQs4mq/YkCKrr3eclWBA==
X-Received: by 2002:a05:620a:198d:b0:8b4:3ea8:b30e with SMTP id af79cd13be357-8c3893cda6cmr1078782185a.46.1767950638315;
        Fri, 09 Jan 2026 01:23:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm205549655e9.2.2026.01.09.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:23:57 -0800 (PST)
Date: Fri, 9 Jan 2026 11:23:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: edp: Fix NULL pointer dereference for phy v6
 (x1e80100)
Message-ID: <mpsleuqskx4lostvat4gz5jdd6onyqvgvfx2zkwhfqwf7yr6l5@yjyvqpssemka>
References: <20260109045214.5983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109045214.5983-1-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960c930 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Igzy4eZRXihRzIpaGPgA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wXhzY2Ek2hoYVPAQz5K-R6PdPkWOFnLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX+nIlGEy961ta
 MMrIaUOOll1Z0p5mHE3Be8syX9mcZ/de6MsS+szJb3c2xalM05IrevVXj4c8lyGEdod5e5QYLAL
 XnPNOnEziJo72dxJmrdz+7MPmWM4xWGTp3t4zdEokegFRDoOfpC/2eIf6p4dF78jUOoUMCQw1Pp
 AE1l2yzBEm73PQ3Z3f1Zgy5WC32PtrbDWnpnqRDjI7xOZ8hIyvvqNJdZ3EDE4BCRgFIfPuImM5S
 RAImMTIor3KQtBJsESBH8anmJ+HkHO3hiiY4fEwWgPBz0/zhFmGH2GX7T+F1+tfsL3LiI38BLXu
 yXhnganfd2EXIBHK+B2duOXlMANwDP1zodd7X7MUfWk4+nZbCWZTULP9Q9Bz/DDcGZ171v0OZgw
 q1ysozDDZYcgZDkqHoAPTvCpuN6ZVL27IiVB7NHlNZa7RUnQN3sfUMZg1vOU1vnQJZdE9T6i/UR
 e6fFV8QJSkl5M+xUz4Q==
X-Proofpoint-ORIG-GUID: wXhzY2Ek2hoYVPAQz5K-R6PdPkWOFnLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 26-01-09 01:50:28, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
> Signed-off-by: Val Packett <val@packett.cool>

Thanks for catching this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

