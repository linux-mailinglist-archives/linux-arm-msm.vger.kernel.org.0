Return-Path: <linux-arm-msm+bounces-77053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A8BD6969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 00:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC5B4063E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 22:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CA22FB0BD;
	Mon, 13 Oct 2025 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcDr+zXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB94246778
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760393539; cv=none; b=qu/jI8xkOI0HKwUDXwUVV/oV5O0j5uscVsohm1xdtw6WBR/hRb5U0v3udr+Ufg5R+2XDBZM0EjDKubnG/mUViaLaBTRFF8aPdiPCDK5EkFPTQwG2VNRJD58ylMF0XsYuqD6XjjOgnhBZAHdFbjZ9Ddt8Tlg8WL505jvW49+5QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760393539; c=relaxed/simple;
	bh=cJWDqXMScymTr++V0ujS5YvVDnw7gICP0AeYFNH49Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEWRTiHC6hwX8z0MyWM8KTbvTlVmLlDVHGjAF0trTjft0CAJSEvI+Ut6KRc2Mr5/xayTjYusJkTYGMru0sGzQRpcCcHKisYgehTRmGQzATjoEkjKdlsJM12TuD6B5MgFKR3fFoxv93dp+IWEU7Aw17ZUTc2yNhsICUUAVZYt4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcDr+zXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9bV008110
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82Y2ESNzx8wbZfFpXhnmhBsvMOJ6zxaA7xBGUZX/jxQ=; b=dcDr+zXlw1RoHYEO
	E4StZeMQ/g6g8y7WoxZ7JdruVknSUX1+eV/z/VEsLG4zLTF/Qng/MXKiPHgE663c
	BvWjOsOzWuUpjU9dAC1OkccCDGP4ZPBXZDI6yG7PFCXak4jq/lvlBuUkhVF+fPTW
	AtSrbdnfdIrQM74MgsXR+VLoaYgQW2POIR1VBIP08XQC3+eA+vSwxhlyY39G2VrK
	IUJFwh+zN8MB55RMRETyDBinjao8+Ght5psl6PNOrw7+gYblmEy5PBR/JasxDec8
	WtgBgaSNgwAgVVBCemn0IOk2puc9R6tNrv6DhnoeUjOWt/fRPtQxni10Y7fQGVw5
	Ev1r3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt340v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:12:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so7519425a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393534; x=1760998334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82Y2ESNzx8wbZfFpXhnmhBsvMOJ6zxaA7xBGUZX/jxQ=;
        b=o5XpXhVVKH//WkoEYFmLpZOE85o0e65Fka34XBK7OlP+5++8EFL2QIE0MmDQRfVk7c
         xYcIhIwzfdoF9ZZ8p84YGfKYH8giZRrwN8uvWg7SSf5JUQYq/2MJ2WL2DkTFfpnhDuaA
         bnkTDhqJPyk+CbQFaoHoMrr7v68mfg8PHmXE/KXAjmEAn02Aexq3dxdCHJFPq9m8aOuc
         /FzQTl2DMtHjLjTmNRBBAhEBqcYgitiEZM5mYBZ0/hwMgpm55mOIG0cDWxVjamUm4NPz
         P24WaPHCAZhnCqMcb39+umWIQ8WzqiPu4gRwBQqf2et2IRVaH/9f3qvqfvLHpsSjcSha
         uErg==
X-Forwarded-Encrypted: i=1; AJvYcCU6et5CJueGRDhHVbKu1+NlyYECbJkNw7P8x9Ao4P5QZtO2B1l6uLx4XmAYYHCZGh0JjmoWKmpt3QS2KvUA@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZ6fzp4cl72q59HzIMk5tHUwZa1PRlzlWzF/3ONjEF94EQPMs
	N4S2ZxPq2vJ76ZzbjLiVvs1ibLFQvRQypmcP8FdS1JxCqEUG+B/yORnn3MPqyfcgSUvbBizhmJs
	HEn24AU2u3KIG7kiR8EJ6dHiN7Y5It2vwjZGEwNeqtoTz+uleEPMOUtW2W6ZDefO1pgFH
X-Gm-Gg: ASbGncvj1cj4erJKehOxPoGqJAGSvR6+2aJG0svKSW7KakZIoB8IyYXc1OS81NDo3XJ
	vMvuahzqvPPgCyTBI9AXKxlMyGeiyjOHRDL9fBJInzNST6mCwTsku2xRGa5ei8Zvoiy5tT6CdUM
	qRA4LkiltvsGmoI5PjtjpcrZ3HHJM9q7loafHRQcK22DG3wrrq9kupD8GfG8hijjnuj+ADCgm0U
	Qqk4B2TqbJVPNNmZLY3dCckFjJYMUkpMxZhjX129bHLjy5843wZZifu9YpRYBTCB7svvzB5DGQJ
	Oel0B928VHkApu2+3ii7g/ziwSm49xWExl5WzjKTYwl+fc5GVrQ2cIj9scdZnkaROplc7XSbn2N
	UwGznwxpfZ5RaBniStP5PHgyUq8Q=
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-33b50f2b05fmr30450135a91.0.1760393533929;
        Mon, 13 Oct 2025 15:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETTmeURcZWirOrYydsMIpplDhpkGPn5hy7sXV7d6VJnClJh0zuf4RUDf1xz/iHvBRh7/IBsA==
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-33b50f2b05fmr30450113a91.0.1760393533440;
        Mon, 13 Oct 2025 15:12:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67de1d6227sm50977a12.46.2025.10.13.15.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:12:12 -0700 (PDT)
Message-ID: <afe67509-fbe2-4eff-9ae9-80387651637f@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:12:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Treat remaining == 0 as error in
 find_and_map_user_pages()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007122320.339654-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0jdAkNM0H2kzos1R_-md6UXI7Mhes7V4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX6NVqy1TdZGjs
 cMkbnMp4qgt6+1s8yuvbrKwB9Z+h7ivHx2miDD8m5wmlMv8pmz5xrtHpFij43NEgfu2PvEGcqJe
 j71+fhELWHU3VNacmopdtl9wniXzClcRX0fU19IB+xwP/QeZSA0EzXhXqzouaz+OhdPinx0JTsW
 kvsi8Gd6I/wBLUdzAM2ucnrwx8jkOYsbQ4+L5phZS2fhfWjofZvsZvb/TBBJXyON5KWA1uP5G3j
 RYg+A3ZCpR8DB1faYJ6EI6FpDKJZ/c86u5TWEUiyhz7txQpa12Y1cHpNbp7cYJugAggLSAUJXmo
 ALZx1oAsPEPZwp7O2FhRYV8L4bVDz1MBY+IvdRoJb2p9x/hKMDW9RKjyDIeRnTZj8EIz+N1FVLI
 qg2y/ssvMc/R+mJDJj9Z1tY7FA79RQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ed793f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mizEDCQyCps1tdB_wZQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0jdAkNM0H2kzos1R_-md6UXI7Mhes7V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/7/2025 5:23 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Currently, if find_and_map_user_pages() takes a DMA xfer request from the
> user with a length field set to 0, or in a rare case, the host receives
> QAIC_TRANS_DMA_XFER_CONT from the device where resources->xferred_dma_size
> is equal to the requested transaction size, the function will return 0
> before allocating an sgt or setting the fields of the dma_xfer struct.
> In that case, encode_addr_size_pairs() will try to access the sgt which
> will lead to a general protection fault.
> 
> Return an EINVAL in case the user provides a zero-sized ALP, or the device
> requests continuation after all of the bytes have been transferred.
> 
> Fixes: 96d3c1cadedb ("accel/qaic: Clean up integer overflow checking in map_user_pages()")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

