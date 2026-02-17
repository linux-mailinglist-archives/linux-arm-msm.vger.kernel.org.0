Return-Path: <linux-arm-msm+bounces-93198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAtmJ/2IlGmxFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:27:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6A14D8FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F26F83022939
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B50322B74;
	Tue, 17 Feb 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYiDwYyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glKOKsX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FB36B045
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342075; cv=none; b=FKn5XdvP8mVy0HBc9Z/3Cl/NtYxDcdHJcYdJksY0iiRSesekMoJDmKd1/YnP32fnFNvfkddZ3W+jbttF0QSytPiIJZQ6P+wu5QyRwmHfJS6WaJ7agA3D9rVba9mDK1ifiIvvsBmpV+YpxmxMBoBb+e8edzpzFrtpLKcZSTmjh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342075; c=relaxed/simple;
	bh=Rytm0En4k3Y5N7cYntJbbMzn0xNzWKTL+08emNLC4Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2EGny+ZsOTT/0AVDuX1wN5i8HHoTIzce8myxp5dQI37yQACcmmfe0mrVocEe5TyM76MRg4bE+TW/vu5eeCMGSKKlWtdZo9y6Wlok+0vE4G6wUVQu/APuEp9kXSbA+0zJX6hc4Gn28EbbVJ54YKcLxK3J1HHFYw+CFylgdlw6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYiDwYyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glKOKsX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8xHrL1545248
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whxYKANKm92NTQe3U5bbMwJVwvxRY7Nwp/5V4KisjpY=; b=iYiDwYyRS4JgKO2e
	qp5Se3Eb1my+jt/D6HitwY+DwYs9yfil0w7xPTCI2+JVEHAzV/m8TGzpH4tGkc5i
	6s+Xmmj8uGGOE/zRT5coyAXQsPF4QmSqWHcIeWgkGAA9ZwulLHoPG0QPM2oQ178a
	AhNYzTtZzqR6sT8Gv6qJeKM+8nBuD1uhkfopk7zBHfGFvfOj2wnR8SlsjH6qmlta
	REz3nYU4mrAbftmTC2Kx3xo68gTuBh0DhlYlpZuUyw9RIdhqv1ylT+IvAVFS1+/o
	7ZbpEE32/or3Gc5oznKGa7izsZNtB+AGxPZY6zVVRkiV/fV6RbfVabmw+SQe6ugA
	AL7ZQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajtq97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 15:27:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89496f5086dso35765816d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771342072; x=1771946872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whxYKANKm92NTQe3U5bbMwJVwvxRY7Nwp/5V4KisjpY=;
        b=glKOKsX1apWDyxM9eXeRnd9hhq24N5QcEWnHBU7DIVb/YZZuqJR+qVAUqEckg0VDOJ
         lnk7ITLtsVh1TRLIUXkccYVI7wDaJ7sitZWgTRwYtP2xZPShjD9CNvBETHVeUIDlUaot
         TAfJeZ6kyEnusZh6O1JvKOG5S7cVv8sWP/XXEhYJ6slYfI4Bhl02kDzVncvDY7Y+8mTW
         GiPTq3EtdDNW6mA6pz9yERySZ/t5Io++YqOKE3lS+Sch53yh7cGv3fYkv17oq9y4tcoV
         Kqq/VohXJLqOwqLOA4izSd1ZoS8BzZyIVbeClv1WiLbOkpJ0z+R0l5b2MFNZojgJjVmd
         t3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771342072; x=1771946872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whxYKANKm92NTQe3U5bbMwJVwvxRY7Nwp/5V4KisjpY=;
        b=ra7rewGIUiHZmbSIIX3xUM8/IN9Fh9edyuc2jKv6LyxpE5Aip9ePhNs3QpQ7ONv9Sk
         NrUcAdiVyoWBSZRj2BqgNMORmeSCQY5psJlKKWfdpnIbf5muxhOLLBooeAf2Vy6974OF
         +sGtCcCToAH+71YB4Ov/I6K8jhvrcnbJePL4APVBLS+oTvkqNBirUF7wAHMilCmW56lX
         ayMk+++jHQ5EI+is74aytQJfd/i2ZOxsLNt/ux78ccrzF3QfJthORAReeVoYkfZZ6qHw
         HTN75x21KmPCx/Lcb0yr4zid/nGqgRrBNCE3WdZx/OgoqzelDqPMULIRNwKov8vkbwzp
         A/LA==
X-Forwarded-Encrypted: i=1; AJvYcCVXy3l4tPIhk/S9J734wMUz3Rvjn5PhlyTtvaTzG9zeS+1NZcoB4X1pt2jWTwATcccnF/aDR6swUzHJKAUM@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5XS32r/ZorDlUmCDxIydmkTAas1JFzwRWR4xFP/vOGjUFejq
	R7adnxIt7UZm8Yzt3B2Km+YOLkjUPAnZnz2Ogtn/pKzKIZecUnLLZx3FkK3Jxva9Cgk7EpHayeA
	ySW0J4SGpRRmqlT+BTuzqPNcuz1KE1SwfK1C3ySrHVG/vL0Juf8mo+UrKus7gd/s/ipal
X-Gm-Gg: AZuq6aLrvwxN1Cij2Tb6WHpdFNffXAIGDUevdC02AHKDQL15miJ9uy2wUOBRWxFQvSz
	Uy735riMOxKUuAGhYGnYDlQ60CNgQS6zNpc49UlM7c3AA6y2QW7r2bHR1ywJOkzT52iUt11xGk4
	yWQNcIAO/ykZS+6sYS6p2GrEZfay8Wi9FMyqqY+QeSb60EKGtmqxm+L+32vM6kxthRvEbf5Su62
	Ko+idDOOxQVvUpvkPBrwN3UtQY6XRnVGMpS8leKmEHcWvf1L+UTRHjIs9UkO/14kVuO7Wxx0SUJ
	kPNZU/z8GNJTMuM8gNnpCM0rL4SILsM3wtqNOZoEWbpKwZpyWV44StbS/Xk9FkrkwyR9b/sA7nb
	7cNtfVTFVBY94EZHgtAQJmycFRTyAQHhZa4hvsalQMNyctzoI/TDJKDwTErXnT8Vp9yzEgrdeSk
	RQmn4=
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr136773046d6.8.1771342072475;
        Tue, 17 Feb 2026 07:27:52 -0800 (PST)
X-Received: by 2002:a05:6214:55c6:b0:894:a36b:f7df with SMTP id 6a1803df08f44-8973480967fmr136772716d6.8.1771342071941;
        Tue, 17 Feb 2026 07:27:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc762b672sm365802566b.41.2026.02.17.07.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:27:51 -0800 (PST)
Message-ID: <e110546e-dd18-4ebe-9281-adfbdde98d7a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:27:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
 and DP mode support
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <aYXvBGVdwXTrJNio@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYXvBGVdwXTrJNio@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyNSBTYWx0ZWRfX89xbrwEoD/oX
 nZf41ZiVd3qOC+v32xrTjPZyb/LCK1wNRzJjuMyZnLJhshIMtC43BZKy8KeVGuzOBJFnNu+3CE/
 DO2gB/JeVfYm0T3KOz6e6BAhkv0f6uCroicY7gevXkKCM1CMmws/7MkNzzLg3nJ1uFX4/eQT5ll
 LRzIGxy2QTDD5i9/sNZjWndSC7U56yE5Qr2rIau2ivezPFMvmuz7CCjjw8KiV8sdy/DepcD/Df/
 ZCSXhx/cbdCqBBw7W1+oTW38kKbbdu4hjfuwVod+5ZEJSjbJZskEGLyQno9XAjL74ajocthELFT
 OXPRmEfUQMqKgoklsFCrdZZ65y8FvyqVUuYNLTGDj1Hk3hcFWENqNrFYnnPB/vH/JTZ1qa1WXFU
 RcFG8lEYFIK3B8Oa8diRFA4UfKQGtJ/C4254YXIemiwWgDts2K1XC2vDWNgkY22OeFWMg/Wg6dT
 Jm50+9gaWisdY/3Lf7Q==
X-Proofpoint-ORIG-GUID: AM-SzKt3CL10YjlzJUwG6l8t18PLsvG4
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=699488f9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=neJFtHvG76LURI-aSOcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: AM-SzKt3CL10YjlzJUwG6l8t18PLsvG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93198-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08E6A14D8FA
X-Rspamd-Action: no action

On 2/6/26 2:39 PM, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Xiangxu Yin,
> 
> Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
> config and DP mode support") from Dec 15, 2025 (linux-next), leads to
> the following Smatch static checker warning:
> 
> 	drivers/phy/qualcomm/phy-qcom-qmp-usbc.c:803 qmp_v2_configure_dp_swing()
> 	index hardmax out of bounds '(*cfg->swing_tbl)[v_level]' size=4 max='4' rl='0-4'
> 
> drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>     777 static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
>     778 {
>     779         const struct qmp_phy_cfg *cfg = qmp->cfg;
>     780         const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>     781         void __iomem *tx = qmp->dp_tx;
>     782         void __iomem *tx2 = qmp->dp_tx2;
>     783         unsigned int v_level = 0, p_level = 0;
>     784         u8 voltage_swing_cfg, pre_emphasis_cfg;
>     785         int i;
>     786 
>     787         if (dp_opts->lanes > 4) {
>     788                 dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
>     789                 return -EINVAL;
>     790         }
>     791 
>     792         for (i = 0; i < dp_opts->lanes; i++) {
>     793                 v_level = max(v_level, dp_opts->voltage[i]);
>     794                 p_level = max(p_level, dp_opts->pre[i]);
>     795         }
>     796 
>     797         if (v_level > 4 || p_level > 4) {
> 
> These should be >= 4 instead of >.
> 
>     798                 dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
>     799                         v_level, p_level);
>     800                 return -EINVAL;
>     801         }
>     802 
> --> 803         voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This is a 4x4 array.

Thanks Dan for the report

Xiangxu, are you planning to send a patch to address that?

Konrad

