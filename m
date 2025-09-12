Return-Path: <linux-arm-msm+bounces-73199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAAAB5403F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E2BF7A3FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 02:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F79A74420;
	Fri, 12 Sep 2025 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaBtnepj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6F13B7AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757643322; cv=none; b=QjxEGkc5MkScg5nZ1/U+BtQ6GMRsj2+UPJcX+GOVeFz62Nnui6AI3CBaRIeNsG+JGfl2CG15UiqUvKuWQA4f0WPc4qykItPDKk+na3C24KCPVheF5xlVT59iBfUbppCdd4ENKNG1i2LlntCoTtKEt8Tit1PPZEW2nLJ2XHvHWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757643322; c=relaxed/simple;
	bh=nUnsPdoniE+tkUSymkZCpEkvCRw+wyDI01SPNexGmgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAChiPLzBYVhhnlXNjj/oCA2rgZfVYePtYujLCaRiQoT/fc6Mxeqm9f3LOpwwUkQE9NhhAgECH0VZBwswGvVp/a+skm6uLTvzd9pKvqUjrSuA4U2lRtjL9t8/kcp/VQ84EP3S8Bgi3/gWNJgsNtgjBVnMBbfbP/TWSmEQvdrOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaBtnepj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJ3ZJb002482
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hkf9o+nS9HTVNHq6n76xt6lAi8TAxB+Rb2oCezdkjY4=; b=ZaBtnepjRSjQgZLO
	qPvFGKhjsOTfW8Iv5WaBy3odjk41lZqUqNiiDifSR+/4AgUhKG7CAW7AhLOe4+tG
	5RDt82j0++qNzCrNelzF8VXw5iqx8m38MqOKFGysZCZXl9yw53jCYaDS1Mz+zLYL
	gAbx72dpYZb1Nx/QuUSxqPJbHWrZSL9z0kpk9kDtm+/5KoToUXcbBfQHfdLb+4kb
	znk71yZ7ekCmjUiFF5EXKRO5gPws5UCMVFhZzpVB5dEXZeZfSu6LRAtNfw93uitd
	w40eVQzp5FwMg+Fhv7P72+e7GUPMPofxIGJ+WXR8ziQZ6xa3kFTsxq4HLy3RDNdC
	Hln4tQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsj1u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:15:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329be00e966so300130a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 19:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757643319; x=1758248119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hkf9o+nS9HTVNHq6n76xt6lAi8TAxB+Rb2oCezdkjY4=;
        b=v35Yuqzlj0gORf+eCBrL6bjaKv1xoyT4CIIx8BXwDar5/yVHaEhG/+qwMpiZVUNhXS
         zcR9t6ysbpLZZHECi2MjAMMoZffOVjiYkxKC5dcPrd5zX3FSgVk7Jru0lXQUtndG/bpX
         BfVwkhucUYTMgFecqLoKljInhBIPFmLSYtih3bwjKOBnmUi36TtdUAg3Jw27PwJdTrub
         QSJj2cD63QlzgK9uFHmiPIdJOvB+3gUKHai+RYKEaatR5ZVk1u+w/IuVayA24LWLJxcA
         76lMt3X/hHOxRXU6szIe+N49/FgQFDTkagFQt5/tRQCx8kTEPtIRh5jLl9J+gWPJVXZn
         iu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKYkQTkhK8o65G8fYgpS/N+Mdxug3FdS/6tiYWsl5XWzmrj7WUZ8R2iARUdzycvx6IwMB7W+3ThHjQ0hHA@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6/5y4c4+n2egmJyerwiXLvZ4Zt7wxlBVSmEV8R8MfImfEEb6
	j7/h2w1Cidag8HdCw4X50eZRM/cBx3/SrdePepM5NpQZF20uy5H6sGSCx6L6ASdfO9HiU4kE+xX
	EwiegUJGPSWLAFy+27yZ74WEru/hXGRYGquecHrZj8TpCyb4YeapmUrNvE5ahK5jwegrB
X-Gm-Gg: ASbGnctLbUk/GM0Y0F2qxWr0RrUkYxJa3qnUE6L2I/ma2bYbr8ZH/rtXnjsJYLoSoQs
	rhuzl563IXh7SNboF+pat/jhdstKl2lnBmyhW842FMGWU1BBmJpkmKCu502duMBxzZVHhCr8Ixj
	waCc967S63jbr1f9nzxu6u1tkmAZv9qNMAL5+2GIMkOEFuhx9l4Fua8otc3QRB8PVkUimc/L9eO
	sWyByTv2G8/Hh9muaRboOLruKRQhSlGrLlWyTZMrNSh5cTv302U49Vp1ERr/37tZBYV9C2OH2oJ
	FxybWXlA7z+D3ddDfE9j0YyokxRiFVhJjZDd4PZv9R8CCDlV6TZuC7rEiywMyA8AsBWmFj9igYZ
	sWmiDBCBkMUYSoGZLqGKdkjQPx6b+IQ==
X-Received: by 2002:a17:90b:4f8c:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-32de4f90745mr761543a91.5.1757643318976;
        Thu, 11 Sep 2025 19:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq4qCtfCRzD4DYH+qfi319AoKpVQ/JAo5O1h9fSmiMtLZQuLKN33nsWtedkSONVwq6ENs6Lw==
X-Received: by 2002:a17:90b:4f8c:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-32de4f90745mr761524a91.5.1757643318503;
        Thu, 11 Sep 2025 19:15:18 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1edc7sm3597818b3a.66.2025.09.11.19.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 19:15:17 -0700 (PDT)
Message-ID: <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 10:15:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
 <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gXIwcfUWHQV9WYsaJUvQcCEq9W8aIQiA
X-Proofpoint-GUID: gXIwcfUWHQV9WYsaJUvQcCEq9W8aIQiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/78k2xb3/C8e
 919lAAZO66R2AT1gkTbCC5zyg8K11p6O597MWorzQJK9WgZ7ZMfHXr3Bi8Yah5m2g1cT6FU/uQs
 vHg0oDhzssaur9m+52Vz9/p/Ctb1+EaSJ9LTH6Ae8Vuea6MjalCg+/Q4Ljb5cEoDwKNP/ZVpRnn
 IkTizB37gJ/9NLqiS/HKAHfyc4BmVHt+oT3ps3nkU8wPVxmDQTVTTjlE3xH8TYp0z+MH+4XPkpf
 yJkoLeuM8YGPHT9CXEd08r3HmEw8PR+JLqOS71HMP37oAMjW/o9YRVBEgRFRPfl4/TPsOeiv//9
 nHorjl6XlPlXOZ1SOPSLqtBZg0MRjonibkzVxkx+KuBMugxgPaKs3p5GWKhZbqqQE8SQqMoW8H1
 Pu5utLUH
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c38238 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GWYxvd0U3zBiv3KBAmEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018


On 9/12/2025 9:24 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>> including register offsets, initialization tables, voltage swing
>> and pre-emphasis settings.
>>
>> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
>> platform with its USB/DP switchable PHY configuration.
> This should be the last patch in the series: once you add the compatible
> string, it is expected that it works.
>
> The patch LGTM.


In v3[12/14], the compatible string was placed in the last, and you remind me
will trigger unused warnings for the earlier-defined qcs615_usb3dp_phy_cfg.
So I merged them in v4. 

If move this patch to the end, patch v4[07/13] will hit unused warnings due to
missing references. Should I squash patches 04 & 07 and move them to the end?
I'm concerned the resulting patch might be too large.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>>  1 file changed, 141 insertions(+)
>>

