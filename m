Return-Path: <linux-arm-msm+bounces-39710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B365C9DF035
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 12:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07F7AB21CC9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566571922F1;
	Sat, 30 Nov 2024 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXba2dg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E46154456
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966650; cv=none; b=NYcTSaZzqIrk46B3ejxQ6kL8GwpgklOPHDzP4pEJM1zs2Nd9NYMvgy91n0zX9kH3Isya4GMJFHUgv10QdC7WWWP3r7yzB5eaTwso7C/HJqmGw7BPGn8D6JF5nwcer554oEtoYz6/2IBRbjQz18vxLnhhiCnhTnUveMZ2o0nKb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966650; c=relaxed/simple;
	bh=Thmgg5qZ1Ayj21DY0zxPd/gKajl715z9C/UHZ6SA18Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3xKFaBYI1FCNOHG419e5ZdEeLhT6r/rvBojhV8abkXxMEBYJOpBSPrNZ2P+5VdQy59Ra/yolfIWJMszdnJ+CW8wbCz4o/JyTcvBNulxcaiMZkE2WF5NCBq6zbsABX4NEee9T7XhgB+wWWxKWqYp2UvQ6JEFMvTQaTEbdGF0RmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXba2dg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU4Wd4q019137
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 11:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZvpAxmieEw473kwTlA9LztuKkMS27kGy1qIBHQ8Lng=; b=fXba2dg6B7uaj/8F
	I0Pd5UltCnJDKkvPA6mW6kOMXTA+eCTfLyJyPMZ/zsy5rJe11ZRK7GiwMYL4A8Ig
	kvSTPWpfwLbs3a0yFHyD+TAg3NJTSGhWPsLHOnHmipBhVCBbIbyuLKK2ZD9rNxRv
	KGCPB/ikg3boxGgj6yw6EhAMC1U2w3rj4uTmWefJsaHe0blB+sKyn4JabvOLhgpQ
	VMKHp9dzHBBJM9QTz7tiEkRo7B9Mm0ihC970sXN4ybiy+cTnl3P+jnxgIaNdtg06
	xcDS4HloFJwT65/sNt2Lcz+HLNssO1Lr8lu3MkgP69/0o+UWwDyWb2Ip0ISQrrhw
	OWoc9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1g8q4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 11:37:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466c4b8cab2so3774361cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 03:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732966645; x=1733571445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZvpAxmieEw473kwTlA9LztuKkMS27kGy1qIBHQ8Lng=;
        b=tzoHIChUByvB7WAXkH4sreBXvW+bXnl5WGhonrUkg8WPuB7YecHjlyIiWE0Z6Y9drD
         oYKPCIwpALazylTDm2EjdhS/yXPsJW9rccBPfYNhzjOp/u6szmYo6qS9ZtspvqCtqVS4
         hqFbW3iF7tGYiAwlTJw2FGkOynAI0cBuZKxPgHZKjIOX8xOJGxHm0107yIQaGoTiG7r2
         BBIdyHR6TIROGGM2X/H4ITuN0s5bEOlwqVRC9YdqZOtmrY9DVrdyzRON1VOn8n+prv/W
         iK6VlbukSa41pyPIErJFCT33xe0Ne4VBIK6Q6EupAjSkUZ2p9q6xL0ziz6rtBnf5BJKT
         jU0A==
X-Forwarded-Encrypted: i=1; AJvYcCWFIDXMHYsVerxH/QOsXZGymGl6mHZe0ha8MXJQRKyHP5HEiizu4oaW1vq64YW71+MaPnsbIkh3j50ifjC5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/tfZp05mtzpQ0W9OqTfvTgh2XIAYjAqnOlIuDrDjYv+1Ehur
	Xo4Y42gUsT0mGlGajP+GqJnFg0muFlkBN099hnWHYdByDhpY3htsVtFSmfL5NAM1IOhz+kkMnYQ
	iyrfpjb24I5Px77JGUWnnJs9JlC6K54mwiGaQ2irllq+qwfJ/ejvb/CIDGG/YGxra
X-Gm-Gg: ASbGncsYwy0WEApO5ZYIrjsbDxVeILY8cVxydQREdsuiMVDidjlU/6VDOamLzImnOjB
	bQSH1ZXAYverEuUmz3Ap8BtZQinsWSFR+pmdSZ97jhPlyH6SPrjX5KQ4PMjSlIQTHOVOBprr6f8
	pOuagwMWODnQR2GoWWCwF/1YmaESQrytaXIVLmCvX7sedEyC8aflXxLpXLQf2W3P9bw3KhZJZpI
	VG7Kk1XQRx1vsJMJ9BSu2hLxEBsapQUaqcYleBTJR7FHqpG52hwDQKu0Knpzj1WAx6pessMtE2d
	MptNlcn4aLoY9tv3zyBkRzilIfo0zgM=
X-Received: by 2002:a05:622a:1a02:b0:463:5517:ffdf with SMTP id d75a77b69052e-466b36d27cbmr76067691cf.16.1732966645290;
        Sat, 30 Nov 2024 03:37:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzT9ypsq48UF7x887wPpK3Ma8DeIIzsTE7qzn3zdK4jFniAGHsJbfgxS0eMI6V8wqi307QdQ==
X-Received: by 2002:a05:622a:1a02:b0:463:5517:ffdf with SMTP id d75a77b69052e-466b36d27cbmr76067521cf.16.1732966644925;
        Sat, 30 Nov 2024 03:37:24 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0d1de7429sm195217a12.74.2024.11.30.03.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 03:37:24 -0800 (PST)
Message-ID: <6e01c2b4-2383-4c2c-b848-da3f3760ea98@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 12:37:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: x1e80100-vivobook-s15: Use the
 samsung,atna33xc20 panel driver
To: maud_spierings@hotmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
 <20241125-asus_qcom_display-v4-1-61a4da162406@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125-asus_qcom_display-v4-1-61a4da162406@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6M63r5mAZMAPQdgFumeAIM832YXqljs0
X-Proofpoint-ORIG-GUID: 6M63r5mAZMAPQdgFumeAIM832YXqljs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=781 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300096

On 25.11.2024 8:11 PM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 uses the ATNA56AC03 panel.
> This panel is controlled by the atna33xc20 driver instead of the generic
> edp-panel driver
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

