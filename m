Return-Path: <linux-arm-msm+bounces-84569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BACAA564
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54C92314B405
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76999257423;
	Sat,  6 Dec 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1xQinm/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOiWTpKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347223BD17
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020882; cv=none; b=fVx+2pisbXKkfau6vE9aEw3BCK4aka+F7LMhE92uCd164+nQmOeHxnT5Pf5CD/eunGLbDPBeT1Du2bWd2bfFw/ep0McF9/WVjm47CwSxonVZVFdml8iV+mvBlbRjouKqkegYuZZ84EklSNQ4LJdc7TTNOoRFWXFw1YhFjTFG4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020882; c=relaxed/simple;
	bh=xSpsL4b2zIce5I2dOY3sUE/zfutjJQr0aBnTyOnstvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdymGBvLRqj3li72Jo079gJvv3o6l2OiPVQZivX84Xml5bTOBdQDJgcKAYcRL76H2amrI0PIuoavG7MapZ/0p+bFIQ1yaWJqvJmmyGujdHgZNUmFBC+hSuDECgR7Xxr3Bz+iOpDtbRsWLIXtLYj8nM2RRGkpZAIFkTEJOks8Bwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1xQinm/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOiWTpKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65VluH2258750
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bia8srXgCCulvEvzZIHpajn0
	2TpGhEwIbTJuZhXTrb0=; b=W1xQinm/k4e8Zjtl6BngHFIx1HzCJ3O3vhKzZ5Qx
	Zj1xYMWyGkD2XGnAZdeFDJNHEG4H291hTSnsVX2K1ZfBirZ1zNDedctjSc/mtslD
	gcsgqPuUJn2VhkvIGwBRDIl8ilBguyxtT2f61a0dHqQAC8nvWy/B8kiw6N9qQyb4
	3FrxM3dxyO8foH358Ml0m36Th/Wd0g6hfDcK5oBUANFjYgqBGOF9QCxJE8NqC1VG
	1QCICFwIHcwq1IZI28/I2u8Y7ABENn+6IC2t3aWrbAc2fb1QPzU4UPeRyfmER52N
	TOmjFedzYMu50e8W2ap2nR9F5q5Rjb5qXtB3VJ5QtjzQjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ava6f8vv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:34:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b4f267ba01so875915485a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020879; x=1765625679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bia8srXgCCulvEvzZIHpajn02TpGhEwIbTJuZhXTrb0=;
        b=bOiWTpKC4sCTXm2pzLPOH8F0AkokthIDGEB3D7pbchSJjfcQA0sbeyEfAh0QTKgT3M
         W7qDPWC76MjkBzWAo20TTF82YORJzrM2aoPsLwaGEtnWYGuoD+oKbwORlqXRKi2QdnE+
         QSbMkskJKc44DAnO8GubN7J6ZUiTWiouRBRgF6/ahuqN8qE/tezyBBeWgi6b3PLAkLuV
         wfIO/oVO26IYQS2fv5A9Sz59YgsLGcl4KHwE4w6vWdA0I+sL/uchEWGqZebopfcCp/VU
         D86BssKVzDFB59cMb3gNI1eHub77fkGqY2z2qRtNrIL5nSDgiUdu7m1ytbr96JtXCrYz
         UlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020879; x=1765625679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bia8srXgCCulvEvzZIHpajn02TpGhEwIbTJuZhXTrb0=;
        b=hU+2fVQwgeftBIVsZ90apJsaqcdG0BhoagJfF7DmeA+5rfpv9/3QolLlrGsEYn/2Tf
         dtM5xuu6o6LDNojhpbZXQHTPLvQbPtJhMuibGd5PvYWh0X4rVgSPJBnnRMccVd7uhbUZ
         jbFJ9SbtoDte/ZwlGh80mcyG6h9fX9ayIlvn1oVIMvtm9JMtB/q4s5XIOEK0KSrsmb35
         BOB8454zxFMXA59lumKR46IyokTnisvqG4VKKSDCsHU7nE1OZmwzmFO996AjttrZgdiK
         awPEh0gXWIZpAZwUDyp05C6cpDPCwlig9XLvtX85DBdR9OdP8b5QulLGqxG6QSewCV7h
         z86Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNIhW8Wb8Up2nAfF+cmX1ieRaMrRHyIA9bjMcFPB4XDfjX7XakzMwoiQgvStz3AuJZ4JWpkj3+6hr/L632@vger.kernel.org
X-Gm-Message-State: AOJu0Yybe3SppXHVmmZ1t1wjsE6Dy707eDNUf64k2IAvUYtHxDwOMnzN
	z3aAVsZZBxaOtSVWUvlLWh/VWebH2huiucl0FFyXZEYJG4PBjBkIE/OBaLTfNP+U6J0PKuU0uhF
	xOnsaIgSnL1id3p79dujvOvUwcL/YJi+bggEXh/9i+856JUkavoRRERxp0YQYTdPbm2I0
X-Gm-Gg: ASbGncsL3X3Or0g7h0hDkiJiVnRHn9XwPH9tP89Fv4RyhX7k93kIw91mrN4L38E8T7R
	qXXKxws8ALqJWP2zWyem+VmPlucHdub2MhA1L5YMiNH6juRWWsLNfLIywoFXqrZTAdyR7oRbV9G
	s6I4MISpq8785SZZ6eBkrE5AoGaXy4bpI+rwjctr5z1gdHjS1YXlidI/MwW0WVGFszZnBs2iw1d
	cIMCrsqWPJQJR/+R2J2M8lXaMv3WTtK9HRavRGGivnDZq6AkGKsqmF7Z7vf+VNdx1dIyCoSdoSq
	RlzL/8928PNf8sqiLLjIcBv1+MbOiOOMHxfVv7dygusEfWdHxPJYaExdG7+cndyan1ayAISVQEs
	ZKHRajerPYPYyawubY9ghlHsJgGspEQuFuXnLQpXyEt7wgngEElNxG2UiYgsjOTjFm8kcdOGdqD
	0L/TPHKimHzDUFZ5IwEFYhq+Q=
X-Received: by 2002:a05:620a:4104:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8b614181173mr1493845185a.11.1765020879166;
        Sat, 06 Dec 2025 03:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2fXxn9oMzhK0QPHn8rc/X2u2cWkcH2yL22YeCAgzaS5FxBN40uQmNdOsi/vzAl57uAfIr/Q==
X-Received: by 2002:a05:620a:4104:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8b614181173mr1493841485a.11.1765020878685;
        Sat, 06 Dec 2025 03:34:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e705e8292sm23397261fa.37.2025.12.06.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:34:37 -0800 (PST)
Date: Sat, 6 Dec 2025 13:34:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
Message-ID: <tp2lubkvapjwaxs6htxifnf7hm3y7barocfupenkvo4luw6nl7@z7hx7evwrl5j>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aRJYNj90jMZGHpvUNFL5jCpNEvAou5Qr
X-Authority-Analysis: v=2.4 cv=NYXrFmD4 c=1 sm=1 tr=0 ts=693414d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GmSRHzHddRRQwDRSliMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aRJYNj90jMZGHpvUNFL5jCpNEvAou5Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MyBTYWx0ZWRfX4NaR3dobnEBE
 eJgpllTgpibBSrEovcbchuxJB400euUA+bFs5iutZLfSMhPcg1uU9Nr+QT6MpfD3/Mmf8IIvuxR
 B+I3CwqEYgjIlgI9TSrKvCoW/sLbSvwg6dGyhl5ITZtWq2R9n1+1qWl12jBCSBHA9ZQMMXZ/uZa
 oWg9/aoXUEEL8EW7GYjMQoH8g/cOTmNQGAVAQn84xz8VPthJ7JmSl3hMT0uR1rbU9y6XaKFGo+h
 tsWbsxmMjGrYZhCvlcTrCCmnWo8ZpQ7fC3C1zWtyI/bAWrvGoBqmrti4RnhnZGTuG4FXMdhzqP/
 8L7h/6JAq9A5+2VvskuGWv+I0dRWJ5Sbi79WyMqijyGKe+31Q6rJquYPDpOvJQcAluXoqdF2p0p
 tWsh60euPjLj/9Prui1WFGib2whefA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060093

On Wed, Nov 26, 2025 at 03:27:15PM +0530, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.

Please start the commit message by describing the issue or the problem.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry

