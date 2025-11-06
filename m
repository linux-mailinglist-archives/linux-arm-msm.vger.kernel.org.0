Return-Path: <linux-arm-msm+bounces-80603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4FC3AD9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 13:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6115344499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 12:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB80E329C54;
	Thu,  6 Nov 2025 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDStMgLl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxzkpfjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162482F4A0E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431485; cv=none; b=CWmhjw7lVt44MpOJdtHp/Iwj6Y9xZgDqWqLIkpAm+4qZFTVS8VF1qEjzh+9eOolz6q17Od44M2GAJyPwA8bI02hWA7duZFaATNHJzAg6vFwr36mO9KhTuAxJ3U3j29jLgFywF1tj7ASf0yr3j3ttpktyZ1I0Edlzj2G8JpH98yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431485; c=relaxed/simple;
	bh=oToZbDseNMfvJIhLItkpjSWR/yz5mGiMVe5afItbn8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJW+sMfzkWSkPpyDZkYQXBUi1BTy7NOc6VxoA83WD7dvyZk6zyQjm0v9JRilO7Hj++YViMHhobN5FEnE12DJ9VTBmMcPt41DtEDlwANdvWTOfLf0LWZi2O/S7RpaEnOKHILdBa4m99+Ysf0SZCEHyxX6LK8hp12r6iZgLVLXn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDStMgLl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxzkpfjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68bNSW2326484
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 12:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+sbWdVZxbSXBuB8qlQ234qciN5uD2hvXJOICtWjjjY=; b=TDStMgLllqhnA2fY
	p3mr9kc45QrJYSK9ISf+wYBb2KTg08C9/7UDcx8pQ6FJtoBvPir8Z1W3PW44sVLT
	szFG+gF8uk2tRCzuPQobJgm6wJ0IJ3FupnlafDGaelYLFe6C/WwaJhT6sQl/B9Wg
	0mAuZEqCwoRCIskhPAgdZUueJOxZxzBsKqRd4GScEWJrUtWmXzWW9IJArsk4a/E9
	cl5S7XudoQr/307tA2LaCTKCRfMXeI4Orx5JuSXK8+2QECEFh38GD6WCLKBi6Unu
	uQji6BWBddqc1qixhmjYiAqMO6422cUZct0mwAyF0EESMqf0qxpk9RNzVHCufOO+
	JObNlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v1tmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:18:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso1006497a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 04:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762431482; x=1763036282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+sbWdVZxbSXBuB8qlQ234qciN5uD2hvXJOICtWjjjY=;
        b=gxzkpfjP7Kz2+9izIArPAjQqKJmcFWlzaTKxB5j60U7VcVm7Xve9qXDlBMMJp/C829
         FDKo27RHITSvQhkYgPx8wxoazPQ6IaK/H0dtU5Tu5R3/7AWO9KavCTh2mH9phIeMCKkW
         PP7oy8yWSEDkF6LzlHj3WvtNoB3MAMQTWE4KrY3hnfWbOfAFhDv0vRyGFlNtTcxoqkQ8
         ED8YbGCb//bEjyyMDxqce3j8cuigghW9lrzx/qfIScCrNS9FE/t6Q28xd6AoPfXVVPKM
         Q9Mbb5XM5gVsP4Ds8ai7ABecNJV/30R1p3tx4OpWeXEA+I2H6MLMg/tacS6fjpRT8aMi
         e/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431482; x=1763036282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+sbWdVZxbSXBuB8qlQ234qciN5uD2hvXJOICtWjjjY=;
        b=SCKfWaFv/CuFp+94fX/0TY9pdtsCaLTc3A6dtxpVaY5odAynvafKVreqICP/6LI1qr
         mVtgKPSO2v/2TDZrKcvfcCDnv5iCgB/jAZL42xJ4Yw/zwZpu9Q00ACAaXz7//szEkfXc
         ap7tawS9Ji8FW258g0ShSWgwFtKUrjBtggGmFS0QoRUXHETFnsTPtUV9G5UkEBjIuIsA
         GZzjSG3VT8t8NkFcm9w0gwUSEpa8K/pcZdXpchXf0HuVTKXGfhy3DuGjA++P2634G3mq
         tTUTkm1stXpvogiSASwkrxRCp12Bol545vpdNLeGDH+nCfv3JmQrMWV/pOYCjfrhgfvr
         hHAw==
X-Forwarded-Encrypted: i=1; AJvYcCXEJAMtXEcM4Sb8a/f3KL+Ge16s63/yUSs0UpUDWPAlZvnZJ0XU/AqFuB/wtmW2OVSBfsQBSgc0ruaO25gh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+gCde3s3WkI1uU9Jjsj/gMChGYiboXJt087iheqBBtXcuybwl
	yHKfk6kg2FYAJ5+90glJzNWEt5aCYL+2RLOhRPwTnc1Kix12G7EqV1PFm6YzQdOBoOm8iskiziJ
	gn1qF0/TAJGK6wYgp+dcmR44q67bJNMzZvc1lnbBxlMNZZFY8dR10qCYACdC4H2KocfxFCEavFG
	3/LWBSa3NFu6VuI2un3s0SRY5OE8iY7X1MdLbbC2Ji7vs=
X-Gm-Gg: ASbGncukiUgSGJSK7mxzNRBo5or+pPTOiX5flLxIJvDUxS7ewF0IiJxKgY5NBFIP7Rp
	PYUib+jcYlxldODQ3EZxjfeQ4ea6l26d4QXC2wZyvNf2JzIQj/G8TKSYe1wri7okDL05bQJiRhF
	D0+FWnd8Y7qvcjyBRTgk3i6b0oX/nPRHuR45npgyfeGUg+MgXc8joeebTyC/+3igqkTNsDrKuoy
	XZaU5UT5SucQA==
X-Received: by 2002:a17:90b:528f:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-341a6c49285mr8076203a91.9.1762431481619;
        Thu, 06 Nov 2025 04:18:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFSFcWsr/qgEDWu3lthSFDZ1a/v10OQXi58l3atHWQqjv5x9HFWjYicVnBYQGrSoLVqewLhyNP3VG5MGWKDco=
X-Received: by 2002:a17:90b:528f:b0:341:8ac6:2244 with SMTP id
 98e67ed59e1d1-341a6c49285mr8076169a91.9.1762431481093; Thu, 06 Nov 2025
 04:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
 <58afe57b-68e8-4de3-841a-df3dbf04ee64@gmail.com> <7tk2hd5qursarvomuwe7yt574vmjixh23zz3iw6nzpzm6x7jlj@7q2vlik3t2h6>
 <9d5de3b8-29d0-4202-a361-4bcbfa166755@gmail.com>
In-Reply-To: <9d5de3b8-29d0-4202-a361-4bcbfa166755@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 14:17:53 +0200
X-Gm-Features: AWmQ_ble-cjeiMkSHhNt34FmGUhPaaaR5971I0ICOxNQpnlOkD3tg_OOxVHdMvc
Message-ID: <CAO9ioeX0ha31ouOEN2HqJdq8TY4B_Y87UxeBBgeuC0X_inQjSQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC support
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: rXZvzLdJ1SFfRz3XcEhFxa97PhT8rHp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5NyBTYWx0ZWRfXyaTO17E0rEt0
 9ukawy1SNy0eCTOWSW+YAr/Layb4uKg4BoC0g2CMkOshxR31YfcjRA2z+A2ioaSIfSI070rqMBs
 oCN2gQmpyEljIcgoxrCz3RVh3Vx1EXky7tNLRdMQczpT1RofknlOaaCUGxr1EYNOgvEGtHkz1lk
 A0snA6SBRjN/A/C9l7cnd7GMH1Tkxk6bu4Cihr63rngaQAyscvEdx+WjvzSgqDaXP2z/qzcDc5T
 zWp7eYZAroBdmrEUBDXQDjrBHCH9cC/fF2dwIih6A6VUGMUkJrPSbc7t5Cic5/eWICMuKJCjLmV
 bkxoT+mipkCMPsPNk8vwWx/yvShJ26sEq5X9O4x5IjNW4v5hpVNUpFEJaBDXMJ8T5aZoGFtEQFb
 IANb5Ur8TIqcaMAG7/J3z+Ljie02Fg==
X-Proofpoint-GUID: rXZvzLdJ1SFfRz3XcEhFxa97PhT8rHp2
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690c91fa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=fp6pfEYeF8mCZpjmTfIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060097

On Thu, 6 Nov 2025 at 11:03, Tessolve Upstream
<tessolveupstream@gmail.com> wrote:
>
>
>
> On 05/11/25 20:23, Dmitry Baryshkov wrote:
> > On Wed, Nov 05, 2025 at 06:27:42PM +0530, Tessolve Upstream wrote:
> >>
> >>
> >> On 05/11/25 06:35, Dmitry Baryshkov wrote:
> >>> On Tue, Nov 04, 2025 at 06:21:24PM +0530, Sudarshan Shetty wrote:
> >>>> Hi all,
> >>>>
> >>>> This patch series adds device tree binding and board support for the
> >>>> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
> >>>> QCS615 SoC.
> >>>>
> >>>> The first patch introduces the DT binding entry for the Talos EVK
> >>>> SMARC board, and the second patch adds the corresponding DTS
> >>>> files for the platform.
> >>>>
> >>>> Note:
> >>>> USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
> >>>> the SoM, which is purely a hardware controlled as USB-ID and USB-VBU=
S
> >>>> is not connected the switching cannot be handled from SW.
> >>>> Hence from SW Host-only mode is supported on Linux boot up.
> >>>>
> >>>> Changes in v5:
> >>>>  - Updated commit message. (suggested by Krzysztof)
> >>>>  - Introduced generic node name for can, dp, hdmi-bridge. (suggested=
 by
> >>>>    Krzysztof)
> >>>>  - Introduced talos-evk-cb.dtsi, which has common carrier board
> >>>>    interfaces.
> >>>
> >>> Common between what?
> >>
> >> Introduced talos-evk-cb.dtsi to define carrier board=E2=80=93specific =
interfaces
> >> common to both HDMI and LVDS top-level DTS variants.
> >
> > Are those two different carrier boards? Is it a single carrier board
> > with mezzanines? With extension boards? With a DIP switch?

Thank you for describing this in the cover letter and in the commit
message in the nextt revision.

>
> It=E2=80=99s a single carrier board.
> HDMI and LVDS share the same DSI interface, and only one can be active at
> a time depending on a DIP switch.
> >
>


--=20
With best wishes
Dmitry

