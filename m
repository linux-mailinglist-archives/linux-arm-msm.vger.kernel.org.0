Return-Path: <linux-arm-msm+bounces-71666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934AB40ADC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD19917D7A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BE0340D91;
	Tue,  2 Sep 2025 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InSFRzib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4922F16E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831336; cv=none; b=Jm+jiZBajgjvXtV9ntF0/Jch2PdHA46xAULKsVUKL8E35c9LX1KnovDmiIlkLz+fa4x0ZTMoAupoepV4rZg2IOwGhA9O5g4VSWCVeMiDfHrJCfeE20GwFBKXZuAzBDMVN8X/QLuXNh1MzUJe40Rvr0VdXwAUPGCXTPmz17sNPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831336; c=relaxed/simple;
	bh=6JPyymmvsXLgSrpKkNJr7OiXZInk91jh/EV9/M7ovDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQ4P4bAi2q3ZANummVLid3UeAlFEZkKuzTkBuUFrWikr7oIo6y4tv2FYUBQIQgm/pr+qFUky0KbzfsdgepSg8ET4k0nB5+Ao8NATTYt+OAtVXpgpEHQhFAeFJc5olWfUie0t4+aU+6nfWnSUef5mVkqEFcbCxNqEUxZY6JQGIXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InSFRzib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqE02023518
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=; b=InSFRzibRwaNxWCD
	z/bsbdqrOwc/qzpCp0ZFEcgwePSsuq+PLnAdTUP8j91u2j+h8SouEkx0ziTF41LH
	Kn/rmJUGYCzyjdpgB8G9JZksY82Q0tkw+efOgBuKsMowB4s6buF91n3yqGFKgJgF
	WjDnptD3BZes84QXSkwiJPF4aAHW1l+gBl0ChnmL1ECDowViOFnkiEh2gMqXwQ9T
	IY+hI3PdE2vYT3jmF7RzArY24Ld5MWHgTPEH3ASGTGucJGlCwP4L4VzLsKJ7A7OX
	XZQPhRo7ljWEKH84grIA8FLHj8MNhIZibNc19nOzJEwcZl0GMYML2meiA8cYx66U
	m7if2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8r5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:42:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329ccb59ef6so1458228a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831331; x=1757436131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=;
        b=YwLaNgxFWF2RjfAS4dfki7sSycGtLbw6rl1oQrKLzZeYgTUboU1hPP8XfIDKtTH4Gb
         bZsBAUocZAEhScNIcGcunnGrhkV8t5PNAaP19VpVDCgXLia4amX6cZQcc+v12GtNlut0
         1KG0Wq2Rq0EhKoQWIhG6dx0mw6sIspYTzU5bEIYrjqLkRW5yRNjbs/WzoxYDFjRUsDVH
         FZmt+tBQCCU4W4IfQVEDku6jQeutLGfJ3QfTrj0roEBKDmOffI6U1JEH1/p1Uz1JC9WW
         IughiIZkbFhxqxbaccjURsvLoz0p90eVLDHHKT5K7M06X9Ltg6lWMZ6ZaG8XynKOZ/pF
         2AOg==
X-Forwarded-Encrypted: i=1; AJvYcCW12D4SpauC+iBFr0n/HrIp2/4UJu+fWyMNcDEkrZUAARN4I+2fW+SjqWA4jstUiCyb2LA5pIwgX2iTiq9G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4NYI4N6P1ZSzjcRwuNRiXYFzbGayuUnyjdiVBEpxr/gxKXcMo
	kmqfyrpZBxWMEzTYAmFTnRCIw5x22uTztMBx8vsqlHOB0V1tpKyxrlx41WpUTwDQQxcfQnrzT0w
	JWvTaRQ92HJ/wpe84EqzVx0G26CREB6m3FaZX5zUq3UNOXQRRBl2ion/3DEItdLz4bjB0
X-Gm-Gg: ASbGncuyDNrYZWTedpWsAJFUq6bmImuopJeKi6EA26/77E0+qozHmeOgPq+FeCL0OkM
	8IOGNVbLTIqj3+Bu7fHX3lao9opfP25fMnK5RtMx/07ezdoU2Uorn7dPl/gXmQlfCIkJsxgbdwu
	pg+qwuqfYfMoNWUZB6KZOafP6i8mIqXpQqNE7ml6Y+YqiPVpIo3tMnGZJVKhm//JApy9M4eO0eV
	/rNrKdYJ3ZoM60SYw2PVbf1Uh+X35g3GjZ9EP2ZcVQCm209Ve58OZpOGObb1LVmPuSkYdQctGUh
	FtpsvGsne2ImreeKhv7/H/wpWfuiW2U7veOt2tBeRfNA+gt8PpAoWX67cuIcA6lcSu7WGBo=
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856269a91.2.1756831331235;
        Tue, 02 Sep 2025 09:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrTc8edUsC7Q5G+n6pAISt7v2+ZY8Z1MUO2XiPRAk1RhFTTNaTZFdRS7z00ZYwIpbd5J4QOw==
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856239a91.2.1756831330711;
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeeca1csm14607210a91.25.2025.09.02.09.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Message-ID: <c6bfd2d4-ac4d-4d51-8ee6-b1cc4e1996bd@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:11:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
To: Lukas Bulwahn <lbulwahn@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FlHf21-Nm4QgG4NFsHPlqQcX3nnNHXce
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b71e64 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=GxmfVdM8WKu4Uw088-MA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FlHf21-Nm4QgG4NFsHPlqQcX3nnNHXce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXyrxOnlLXr5At
 591Jk4efup2r1dgReg0z9YJaHeah1bIAnMG73o1stU24rHxCAVV5QTLPiGJUVO5zeBpEG5l6MHh
 0DpouL9yxXRhqJsrNVH9lvleEb4EgWtjbF2iPk9UGJhH87P61tK3Ih47PE8Nnt2814rfVuLI1fr
 VytL08TX1UYl+89TTFO95h2dm/mpt96en1qju+ETzUJQUg8x6CHSWROXj3vrryLj1RKJSpi5aeu
 ZRGplPwiwemojPwxMlgXOaW0KjuojtaHYXhdvr5lf0nO2wXywpV8Zj5C5m1jLqRMMeTI2oMPtXW
 IMv8OBfS2KaDXID7K+A4nM+ygnh/Z8Zi5b0IYpTn3rCtkRZeWohD6UXKigD1UHesBeu0A8T01o3
 s8xbxXj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 9/2/2025 5:47 PM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
> controller driver") adds the config QCS_DISPCC_615, which selects the
> non-existing config QCM_GCC_615. Probably, this is just a three-letter
> abbreviation mix-up here, though. There is a config named QCS_GCC_615,
> and the related config QCS_CAMCC_615 selects that config.
> 
> Fix the typo and use the intended config name in the select command.
> 
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

