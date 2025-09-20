Return-Path: <linux-arm-msm+bounces-74279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8999B8CB37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BBB1BC1695
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61BA22F757;
	Sat, 20 Sep 2025 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6PnUeVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591018DB0D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758381415; cv=none; b=CXNwYDpEtAkBVBprhcIWNxDzk2c7p3ZKWkn7EPshA37vjCMsEIIhs69BYSg2mUAcoMZY2Mfl9kdhhyQp7VQ/+YikM9y+NyUuYJT/iWbaiGwzTv0/cJRk3az3bTdh1j4rLvLa7Gdxc2V0C8tnyqZdISNU/wxTIetOxZLHIMDm33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758381415; c=relaxed/simple;
	bh=Z+0u+9STtBAglCiAhHSu7ZcwAT+Rzjx2rUtygJZtGUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHabgQDMEMMW+8lYfEjdi3V/XrLiJPuPwc8brNS4ycOKXFs1Wnzv89SIc2xMY7SYiRR+2S9lQVXaQaQ32VzDKOha+ocYdh+BoJjYEvZXfBKqUoSnjw1VXdaRsOahx1N5fCSSScIJnybb81b8MtjkbJ0hxUwTkvIhzSKC8RSq070=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6PnUeVT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FW2H019280
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+jyAldBzt3O+lpQDlvl0UcYG
	go7Gu4oMJKsbVtP0MDg=; b=A6PnUeVTj7ZnjzVlvTD5fHTS1hZDMEWC/O4i6+ng
	rf8ufIncul1Dg9Zi4jDcvu8j5Y/Fclmw9ooIssX8GxetaMbuA8ILhrOa7rukQG6Q
	Pw8BTysufhYO5a8JVvDphR0n261nPTHP4cH426FN24l1kWeBD42YZSjkcNOYG6YR
	uJi7hlsh8Moj7B2FawhFRvlS8oeOy5rsqDgLHjRQvkw2kTYUqnnbIZWEz2NA03RX
	X/iK2Ix85fxI04suFZrQG1blLK43SCxjctCIXZ4VRc0c0+8KbvnxNsrYCBt4KU22
	OSSX2zSOYe6wN+T0YPA8NVVQ+Y123cRUc5MhKa8hKwH08w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeh4fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:16:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-842b2ad7c28so116991185a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758381412; x=1758986212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jyAldBzt3O+lpQDlvl0UcYGgo7Gu4oMJKsbVtP0MDg=;
        b=PkvAjEP/lDMveQvoxlV0jvk+grPRVIhWZkTMYr4lQDBPPYW9Ucsx2qJx5K69SrN/Ws
         +J1mZvDPDr+EaT3YcpC+frbCuW0ZCiPloaIDCoWpuZ4WhlDVNxo4+1gYk7KsDfr+ou8E
         mCnVQ19CHGLLJ8MQ74ucS4cmziOATqn0PtPzRr/Ay2dOCs6hFDcRRnwKWnfXfGrZxg9Q
         P3M6OX+DD8e4HhvXjK12bySK2dL8Wn64GTTr9+kRBkPGQvpOiC/llzJ2nySjohFo5eXu
         A6yDVjSM5hEnreT88bY+nrXoQ5yjfLNVqKw92RqZvIgFnAoq978QgxxIRZ/09if1ytKT
         NPhw==
X-Forwarded-Encrypted: i=1; AJvYcCXTFbOtjXV5HVyoSuXAMaficonJcsPgQCfQif2ab+OkaHp+eQ/3URQmzqtjNGqZgh7F2acMNZydc57j9eUL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67upqvAxH19OYVpqpyj7Wsrj5n3Rmt/vGZZ/lOyae+CgiixGi
	PXkaf4nJnS6wNNGdqVPoUDKaZzV+lSuRkmF1wunTRli2ntGMDwzIPFAEZFgni4DEa0SlyOtH8qz
	3WLdS0geyu06LXU5iajFFi40wVf5SmF5IThX9Ae5Ywii1Bo9YLFZPo01XV6hZVVw+TiWy4SsKwR
	3G
X-Gm-Gg: ASbGncu8p/NSj299mjHFuz53ryHyrxJIJ8hvViITb5kz9vhXVnbg+Ys9WoW0STkE5x1
	FJTGIFz9YSWFHl0jVrDFM9K5to7reaZhYpGtvWIeeD8VoehMJpovo+12A2owFGPSXGT5d+cojjX
	1Hji7w43LD53lpnh+ZqLPcAg43z5UGVkAYizMhE5h+vrI+QoGB3MLeINkxxCYDQqhRJYvzYiTPq
	pL6unBTAzHoqLIEn81XsxuLygz4O6HR/wR4mDG2+F5NrAQ0m8vDOigu9PRu/UGhQ6+m6Q1aqRe9
	P8DoqE0Yotm44GZOlpAl30Nq2PC9h/7G66gHWK9/3tRugYWAO6F44hCTdoH53SgquY/M5181OG8
	5NsaXJbPG78JLY6rIzXvu8e0ta4vvDxqd0Z3SRzVTc9/SNBn23Ego
X-Received: by 2002:a05:6214:aca:b0:740:f45c:5d49 with SMTP id 6a1803df08f44-79910ca7108mr77889916d6.1.1758381411554;
        Sat, 20 Sep 2025 08:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWdSx0mnQGk/Nq/NA5PY+5t7voihJHBZXCh93RSAaAbgvzjBcB3+3BAVhRHQ14TfWUTCc6KQ==
X-Received: by 2002:a05:6214:aca:b0:740:f45c:5d49 with SMTP id 6a1803df08f44-79910ca7108mr77889436d6.1.1758381410917;
        Sat, 20 Sep 2025 08:16:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a6508483sm1996183e87.49.2025.09.20.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:16:50 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:16:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: kishon@kernel.org, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Update init sequence to set
 PHY_ENABLE
Message-ID: <qpw26fqn322tprf7ci34sn66codluytg6rnkmppdr4jpjwp6ud@hbawghyesvdv>
References: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032158.242725-1-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: 4UafSNSLRwyeiHTag_n4h4N1HDX669Yg
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cec565 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UHvurfnqH0zupzNQNmAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX9l3ORdrFsriX
 LLci1X8EcPMHJqYmeAr+Pc9mVRTf7I9jR0ygHwOyCprrLsp6gmex4MExEHEUbY4CGLhRAFoGFtX
 Lj7aSY7qCkPzlSfXcS4ap99JWWxpA5eUTOKj2K9zexbbnCrHDrL1uiTTLuhkLzYuVoIjIV+A3Zs
 ufrsTPLMynOfUrpVtSuiP7RDPoxJNY43trr9ujGBvIR+g5RYU0sH92u45D2zvUOoG1hRDcgQVV/
 1Hpx9HOHG1cz2HP/XI+G04TgB58ZGAuXoT6HJa4JXgbEtdHXKzMj3rMub87dcMqNuaB4mt5RizQ
 ywtLFxx4AkuzfVjWUKv834d/VdOkbIeXrnBRRPK4iTcdGcwePQxa/NWHQMLc3v9vqQ92IsP2VnA
 LlNCq/8r
X-Proofpoint-ORIG-GUID: 4UafSNSLRwyeiHTag_n4h4N1HDX669Yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Fri, Sep 19, 2025 at 08:21:58PM -0700, Wesley Cheng wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Certain platforms may not have the PHY_ENABLE bit set on power on reset.
> Update the current sequence to explicitly write to enable the PHY_ENABLE
> bit.  This ensures that regardless of the platform, the PHY is properly
> enabled.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

