Return-Path: <linux-arm-msm+bounces-73320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB149B54B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6644F46226D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0718E303CA2;
	Fri, 12 Sep 2025 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P23j4hUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942D3043BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677803; cv=none; b=SmVKqVeoKCO6NU/Dg4heQXAe6LHLgW0JDvdZOomO8Cyyrr5VsqxAMOx3PgyPoFgeW7KxATEuxNPNanTqr4tVjcTiFQDsqz76VnzTwsxfgJPTnWQcgKJ2314f5WhVE8tKdUW/8NOpmxKzvg+79s9R5HB/ONTLqzGsLNtI4hhUlxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677803; c=relaxed/simple;
	bh=isdUtD0RZVWdZOsVxmU9OJKyNgeg8G6d6TYmpVtZEsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3lbpgLW4cGtvnABiv4TURmLh3dW0EsHFYvKih6NcHLG1QNF1QWYMWrOEaWysmvNs32cM9k5XQkG8zl1rw/Cxz619QzAuu7jG05RrpCOwTMyrFuUqgSycNEYJ3u8tSHQHevOXW6GToC5tRcqJqNuQtH2MiQvZiSUZvGMq8a4yKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P23j4hUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fc2X020054
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=; b=P23j4hUnFVWwLMnE
	F6LQig/a0wxm5UQUp6+G2DMXP9+ABR6T/n+Vrkeyh7Gij5PeMMKBvcx6GqOfsAOq
	RYbkeeSi3QkVqV/wERaGFMo4O5LNwhCqJRp06Hka6FzLMCwTYGeNUczVcetKbIaq
	wsyqNdMz/SfG++cNyEF0jGuoKumN+3/tKNpvVrQVZTVCKDSO5XPqeWDesXYXMzxr
	KFK524t9rz3YoMeCM3MdmwdpgYwzdzFNckeEBUaYUDPvCC018hCc/OTh2udHLqH5
	OrxfprTgNkVlRxle6E87JTcncVrGwf9w3pYId9ESgnvabCpdkcB6cGjvqKUHqJxj
	zp8ZEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387xkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:50:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4fa59d8de5so446181a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677801; x=1758282601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YzF2SVlfGn1ORuyJ7oHhWEvFtpmrZnuITZV7ypXxf3c=;
        b=gIckX/F1lx6iOZeFBmd/Jqt8gPs72sjl4rN19KQpEhetj424KWDkPcMQrAAwIBXYKZ
         JGHaDYuXLQpCfJoNEWgYQAIsDUCQDP7EGASmPUudBhTnau3wFXQPzdnlpRylpd9qS+pE
         mxjAWn/1XBBy4YxrDPUOXRkBtxJfr3P7Eij9NZoy4ZdFuLx4Ml88ccniSqDDa3uycf3Z
         338gM1+QYukpTg70HYWksaU3dyi/muIn1Y5/y5n9/+j9+pObIhIkDGgwyPbYqzMQQKW5
         VxUjILbL3sV5OBBFcd6Qptdgz25U573OntjskokKDXzYy3m8Fk3WFEnATQjpRctTgWem
         vfag==
X-Forwarded-Encrypted: i=1; AJvYcCWE8YthpBzioM5tOcfBdGg0fBXFJs2rjRvQB6iapyWG+jRFK7KhJbtjWgiuAaufNqFMH1UA6EFX/7J85hWL@vger.kernel.org
X-Gm-Message-State: AOJu0YyrS4UUbmF3jwMMAQ7XgPYSC5JzkfM7BwshYitjv4qQ0kewdnjP
	BaaUQKERZJhm7R+tAOcpi3sT7U1fsoDDPfywEzuEGqMBhUrpvAwAw7TwSVky72tGKHssYmK0Cxe
	Tkkt8Jzzd6lrTW6NfTIkqghz3v5PIECA0RaQ+tdyGvQ3OAIdnCmhosgbIMnl8TjLsAOeK
X-Gm-Gg: ASbGncsx6ruEDu9g6vJuV0o/1WGDO/Gq9l577rCI0kXQgHF4ODLLEBVnfc9MAAI/tvi
	69zqqVUnwffD0VyiSYocjE8hpgD+GoIFz+WkAooDowLs7nAKRuTijP3KabkPwd8FnFrqESmS2Tp
	FMQc9Fdv6TBK7TdP9X8GHE9Xd3BUzJ1LqyXrzsWsP0rx8/FBsLJjC6RPkYbmIcbbNWhCZjdCkGw
	Z3H3fFG9VgpCqtnHjez8rl6LKUYanU24GLLsvtZtkwVzeLSDeBQQCPSn1uemLfd2TFIc2eMK2vj
	uUD1Y21YPIUioLzTy3l+Qz9W5G1gdJoPyYxroDklzayK0p+yAPrYNpcosQnh5RMBWVFr4ze3zXz
	Ky/rA7fmp2ovrh1VAzG1a9h0dg540aQ==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id d9443c01a7336-25d246da083mr18921215ad.1.1757677800629;
        Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWi4TjYFXB7GnUvOOedYDlXm03TtmgN9ypPJ2FZ+xs8IcitlyLZkYRTQqPLihrLpPvtOZrUQ==
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id d9443c01a7336-25d246da083mr18920925ad.1.1757677800095;
        Fri, 12 Sep 2025 04:50:00 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b5asm47417025ad.50.2025.09.12.04.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:49:59 -0700 (PDT)
Message-ID: <5d25d05e-d545-4b2f-98f5-40bfbcd24d7a@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:49:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
 <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -H4ELAD1A3AQXhWxj-s28Xar1r0QnN1z
X-Proofpoint-GUID: -H4ELAD1A3AQXhWxj-s28Xar1r0QnN1z
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c408e9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vDXniOzG41h6BQfMLKwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX1qNlPRTib5Ja
 h2Nb5UlWfgdoKeyTj5XDoEZ3aDMkwDpM9AuwZZPMgUWqGLZ6xIU7gBLJoDd30s4SLgzXu9Ws3K9
 2wr3nOEI6zZdg2814rmQg+uhve6uPZpZXzoeJRkZxka3f5azk1qTkI1/i+ROydoFwEAYk8+7qfe
 dFAugB6cwxAdbd4RQvwdzhXzoORXJmOTwqweXVL/GbfC5HHDuzEhF3A8/B+N2IpXMjRj/29fPuL
 hCBUgVPWr/haabKjlFiuABoNhJ7MhMWOZB0kxLdOGUeR1ZBEnI/efjxAFlnyDXAVhxteCJFZWpZ
 yd589TDgGWZRrhUXRKXVEk8E/lcbySqDT8n12SP6sOxYKpvmJeZSqJZC3fJvW1zfbUnNbBqkpg6
 LksWqUUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066


On 9/12/2025 5:56 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:03PM +0800, Xiangxu Yin wrote:
>> Move reset configuration to be managed via qmp_phy_cfg instead of
>> hardcoded lists. This enables per-PHY customization and simplifies
>> initialization logic for USB-only and USB/DP switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
>>  1 file changed, 31 insertions(+), 25 deletions(-)
>>
>> @@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
>>  
>>  	qmp->num_clks = ret;
>>  
>> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
>> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));
> You can not do this, it will break compatibility with the historical
> DTS. Legacy code should continue using the old list of resets.


Ok, then I'll update it, since qmp_usbc_parse_dt_legacy still uses the old
list, and qmp_usbc_parse_dt should use the one from cfg.


>> -	if (ret)
>> -		return ret;
>> -
>>  	return 0;
>>  }
>>  

