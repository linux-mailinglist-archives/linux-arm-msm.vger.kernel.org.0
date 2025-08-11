Return-Path: <linux-arm-msm+bounces-68315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95CB2058D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375D9422BC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC3A26E6F7;
	Mon, 11 Aug 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5kDu+Wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F2126C391
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908433; cv=none; b=a7hZ8DLHpAkA8YJt98dVi4y19khegOcmw1SGG6QeIGdMwUOoYdXQLphZ+4pO3UeFIUlVUCPa/9BY8AcMYiqkZfDpALtEwSdYvzKK8gJ7xpAsO/GNxw/6AyX+py1ViMW9GEu+8o2cVOXHkBRrtP/23usA2amw534MfIvm2gWkmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908433; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl8C8N5gyca9qRy0CQfe08H7vE5XLvi7ady0zw3hZ33DSqxkZxn2FsTY0vfUeyLpJAUo9/SJzL710gruVAWiBeOF8KMGcaZMS+Qy+ylQOegW7ahFP4pKG/4QxXdGconeohEbH8WDWIuj1HGoZEp5F4t/BYejmnhLD5LdW3ZeycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5kDu+Wc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dEZV007688
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Z5kDu+WcZfL2dd11
	PgqCrzZRc4uUMFixmVOpyzB3rAo0AkBV8WuLjnKlPJy/gRNVEoQFZuhdGi5cBPIc
	jmQL+384QDMrL7SA+FGHcUcJSd/pZRzHRDNIHKmgI0fUFVcczcs4jx7YCpJu1N0B
	/nocx6w+j9ptPWlOoHymd9PO6JGV97I5wJh099Xrxuq+YQGFCaDJzx5NX+Xwe5eq
	aLUCr5fHKszEnTHK/Y6/2c5KnMFBSPCAeDlMleneI7jJWg+TgicWGfY3+qgRAh4i
	O8UNg6AEEmkV4R6U7nj7wdwB9QABdVDbeMNSI4Ox7JdcpCRhJCrHkeeDf5zB4M36
	Tm4qfQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm7kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7092a001573so15256396d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908430; x=1755513230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=A3RND1gMBsyui/57SeVnHNq28uOAuoye2P0TT2eo26+GE4+bkLom/RRBjAPB7ojMNB
         EUHwK1ogAKqAu68JOz1HVcUC9U/qgG/EKXEFPmnjavXrWbTAKgAt2kuJSkazxrjaYp5C
         mc4AvuL0ywB2StWveo/j3gtGaoPhRo/s3635/XX/472qUJN8gJ9YkOJtAybZPPiKdt49
         VGTBb/vDjnWZrdZQbqeyrozSLnKBTpGYw62NPi3z+932KlEraBGQp7/mi1inOkTnwfZw
         UEx+W4ZP1VHR46mkyg1LvUcYjyViql7dOLt0R/MxM/JNQqZ4eMLArRUu+BYxgu/VcHtk
         0ZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBh2pJG4LE+yIfaQAhfLzROe25s18IR1zspWBH6tJ6+UG4m3DbjFZX8NVvHAsUCoQPvn6B30x4+Vfj+mEj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+VaawaiQwPBk8AiUwcm1cpbCoAbfGTDq35faS9idTlb1UOEn
	gLaICJh779A5pgSF18wQvx6FkSsOuDdDa0Tk45/gG3bH/RGQI32+aF9/PSRIHpqiKvASL+R/w6M
	EkIdbXfKilW/juvVDmtMbB4R0xsbGJMCbfLc+OT8VgRD+fGyUF2dt52iXpJnNeU9s4LDT
X-Gm-Gg: ASbGncv5zGo0YvwHscObc8XtXmoi266laTCzGtDFqIhYPZwrW4BHNEAcxLjejgezSLZ
	0kvlc5pUoJjoJUTj4OuB1pTxwa41/iCO6Lqko7sPpr8x41LVJysOvvklnz/nbO6Vc9romcGvAoL
	xp+X2viAAYCW0G3tTeHG+buukKNw6UdjFT6/fPnC0mShHhCZqhDZn8/Mj3/RFvUFmXY73IHzQdG
	tjjr3giU1+FQCKP43T5pIfy48onbXkzhzg0eFulrksDfVyrTn7mjiT/nDT6TuVlLu8otjCP0+Cq
	YWVztQ/fJuyAoWhUU7kXcDFJk4j1fjtuerfHM1dTHeyv99c2kL+XNUWpX49I01BJkqD8O5v+Z42
	V5DXAmFmL0t+HMhX6Aw==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id 6a1803df08f44-709ac13197emr60600256d6.4.1754908429930;
        Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwOzDhGMWLmN2i3FgRqYSnMd1Y5AQG8+nCHVP+BeNYZ6Jxlh5UsiiwFp8nO+Ut0MqRtRL5Q==
X-Received: by 2002:a05:6214:2128:b0:709:2279:ae38 with SMTP id 6a1803df08f44-709ac13197emr60600116d6.4.1754908429253;
        Mon, 11 Aug 2025 03:33:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
Message-ID: <caf2cfb3-0076-47d3-b663-ca2c1bd21c44@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yq_0Ii9x5bpiVm_rMPK4BZy2Scttdt8E
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c70f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX12Jj+m+7dODc
 gbx2uxD4BJ5zMikf8gTJXMsd422sHYj4HRUQ0NXstlIIBXDe9biVBc8/zcANdYmJFVPbWNkwXgI
 wJgOCpRpKnYkAK5A7nQZ/W+Dv9RWCGGZntq6jEqjuZiLhsr3qN70M+NlNG+brgBIIiVUONGhai1
 ZB35pZ/G7GZdLXBSCbLh0RBf0CqR7a5ZiJfemCI29OKx4IsTJCYHhE6mp/IIT/cW2Bciz9gyMG6
 2Kk7+MM74KUJ8cm3neC0kThNrzhLuq/McSZ+stQGjMIsYup51Bh7VK5UgwDAdNVvk/NQ2n9qzYN
 6+pNqMdR985g+M3+IARoOS/Z0svc+yPfVFk53AcsyRcHor2okRnjP209N6KjETek2yNVIExR+lX
 9g4GKDjD
X-Proofpoint-ORIG-GUID: yq_0Ii9x5bpiVm_rMPK4BZy2Scttdt8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

