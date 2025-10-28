Return-Path: <linux-arm-msm+bounces-79183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C44C1483A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 257AE3512DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814872EA473;
	Tue, 28 Oct 2025 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+F+Uw9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00301303A23
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653110; cv=none; b=j2wFwHhNYduIvBJwgH1t8euRummhizoAgTae8YKF6F4E4Scfv6Q/khhRP+VqlI8M+Y4+24LAcAHHFS75hP+GUJmg3W4STcDbr+yHfqbc9aH9Rh7OeGNlunbosv0/7fbgxIUF/56RVf2xgYJdGlbmj1sp7jzOCsbOgckxE95CojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653110; c=relaxed/simple;
	bh=rbCKjKedGn3lNL5DA8iywRojNwxcHHuGUb+g62HXVcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4mA1ltdIM4YrRuCOjGW/Spt4AKCWLaiqmkfcV/5xkAuO7F7zpf42avnLZOKvl4rmYSMIXJjwdOaZhIzSfU2P3zz5sWQG579il266OEHNzmJVDgU48Du/l+FGj+XcMrTg+R2IxA5y9zJPXh3G7TqrlHNTIAp6awvSByxkxJ9CE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+F+Uw9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7EEtc3813268
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVeMj8aHmAOBLYyWb2kA3eC/uoHRmImo3B+A0gZx0OM=; b=D+F+Uw9RQtOpaPag
	SjSKLaGuMU9gWg4SymJiIdoqnj+A0TFfrU0nWxiHlbhNGoJPPXu53pulvzPAvf1o
	2zG+znbSIP4u1MINv9V89dFII+Ce0oEhf1yNJZy+bYwOgxqvKDHhxe1REvw9Lqm+
	FyEtL214nKq3YzoUnSMl1rHqvmfej/eydAs6W3heDXZ+lhZ8YEflk46L7rqTXnjd
	dxpAIH7kihgHDKfKk/S6sHalqS7w8Mx8A4YSYn+HWOCmITt6Ecej6k21qkHBRxPD
	9V5c67iltDqxn3Revod7BzHKEllQRhVy1+DjsLIdHJGXfQptBovbDJzRc91RE1UW
	SayCww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2ftahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:05:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a43210187cso1558157b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653107; x=1762257907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVeMj8aHmAOBLYyWb2kA3eC/uoHRmImo3B+A0gZx0OM=;
        b=icBm15xktbDYLOe6qDsmgXO7OVDo02a2CtWFeUHnleR7BTBC+IqbNbaEQhNW95g6MP
         oPd2c7f3/x7o/Sz7lGFYEEa+VyyiSF+Rw41f+J9xQvxkkTgLIBeEG4huMmFFuEHS9aw7
         vs53EIgReJ59ebrW5zHpiilbRSiRymVWqCeqJQNJA901p5qaVUWXs7vK2A62675nXsfn
         qjIQz7i4oLghLYGKGVYqCUsrYC6smOBc7diC9lXXdbUyfh7R3SFklQ9ajnLpng6Mqvnn
         yUGOOjBPiB+rW55jgfKAA8u1gEsb6BvGkKIw79CjuYg63lMNTAz+6fjalRJ7HkHWu21r
         YEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIWShbn/lEfLCYaLJK9UEvk+UkjNzEU8oDcpUuj5qUgIx8TGN/C8U1qoPBHuycxYdFFXmPZzGm1iNa7FNG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6u/1g4ttUIFyjnULacdGesZ5gRrefwQC2WGrqJeyqya/ROXQh
	kM2ydTFFCfRWN2EJ53kT2IeBmN3LNQCmheZjy9sWeftZ/h06wOKoUnzc0GHHzaTySKryDRiiJlX
	8xxysKegxYaMnE4lOiKqAXACz08LbGzJRqBvLGuddk0cqSGXKTVaUt7hiRwvjc7f1+yKW
X-Gm-Gg: ASbGncszQct+lmChVnxrVvp/qXbrEk6XMvA5oKDQPglV7UImk6OKo9IpEDhmIHYGGDp
	n01KqQ2xUgXQfGQPfJnZFGLkSn9EcffS8o4avYsV06c3ug9JMEXVRgk1m3ExsjkOR6DyWg4KPhw
	XNxHvXUi1HXEqHo9sEEKLukFhEgveuoqujxjJT/HY0RrI+TwKrTVt5I5nwhBS/5VVeym40mo3Q6
	L3bvxVdRpz8k4sv/GDBEJL23z20uVemBIBBileCtDP2Hza8hUIzWZGpLbSiEz5kd5FvNSuwjHzX
	oJulkl6YuzMujphyTCQmjLJp6IzxjX/4ou7KBWdS3yOyPPpAEYcKpB7FPPClqVqHrglcqoJ+eoA
	AKX8SeGE4U2MN63vJQy02lDa0pRhTwn4=
X-Received: by 2002:a05:6a00:391a:b0:7a2:81fe:b748 with SMTP id d2e1a72fcca58-7a441a92cf9mr3968324b3a.0.1761653107356;
        Tue, 28 Oct 2025 05:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIeqxVp1SuLasX8Q2uSFeqD+JQjMYiarT/vEc4wmKhKICAmfDvlDsrfzm0Vj71rwWg7P7V7w==
X-Received: by 2002:a05:6a00:391a:b0:7a2:81fe:b748 with SMTP id d2e1a72fcca58-7a441a92cf9mr3968276b3a.0.1761653106869;
        Tue, 28 Oct 2025 05:05:06 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408757csm11411627b3a.59.2025.10.28.05.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:05:06 -0700 (PDT)
Message-ID: <d1e665bf-9e94-b078-c984-fa2fb1392a32@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 17:35:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 6/6] media: iris: enable support for SC7280 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-6-48b1ea9169f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwMiBTYWx0ZWRfX52r3TL9FBKv9
 8QoI/5ghlg4yDp7z5kAn+bwduizwm1+Jgte5IRlcmnkhci/644N1V0OiJrDHGLMaQaw4n0ii6Pj
 d8fpvRB2bp6P76hetFAMz3/6WvnjpAgIH2orJE8Sh/LQG1QwDk4gruy7wbqCnTifT/nyR8NeH8s
 nEBXwvaJrwn81Oat14qClhgwTyd/k1OThtYpWd+WzAfUrYc9HAzL4ahsQg9SpJ3tyR9ETM1i5/D
 jad3f1QsxXmUhq2ZbTCfddRwGYzwg/2h4D/gfrE//vkBHrtSbJCNnDSGBdgtcKQgJsdcv7PpYSp
 y3kZ0WdwRmDBqdmKXEGKMcbPKK5Fh1MPEitZoAMWZoaocSCKGKfT9hZw9832eBfj2KB5GgeMRKc
 8Ii7QRp6s1umuf2n6LCfg6DPxlpcRA==
X-Proofpoint-ORIG-GUID: hlOogeKwDOXk9yobsgXPjg5LBcWZ0N8D
X-Proofpoint-GUID: hlOogeKwDOXk9yobsgXPjg5LBcWZ0N8D
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=6900b174 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fr3eplbp6RILtt3BeFwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280102



On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
> As a part of migrating code from the old Venus driver to the new Iris
> one, add support for the SC7280 platform. It is very similar to SM8250,
> but it (currently) uses no reset controls (there is an optional
> GCC-generated reset, it will be added later) and no AON registers
> region. Extend the VPU ops to support optional clocks and skip the AON
> shutdown for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

