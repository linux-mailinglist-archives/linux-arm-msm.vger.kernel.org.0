Return-Path: <linux-arm-msm+bounces-39895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32DF9E056F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8847A289B54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678AC209F29;
	Mon,  2 Dec 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fg0Lbud1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05312209F26
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150069; cv=none; b=dcnU8yt6TyxJAIIP8LX+89lVE3Vz2Zg7fy3YqK1Twk1mkbwiRspwGfOnZCuON5rNbQowfdCyCz+OqPJcoWyP115byEv30UxPukAwzvfiwrDtmiSvoNzGV5UZu4ZQ9Nf5VIPH0xUtMpYgeTHkYg0C/fXpVgn+cCFCLCXaCAc6usQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150069; c=relaxed/simple;
	bh=W32B34bbwL9JbtycBuovG4MawYuqGMzUQhFPk3Po0Hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZvk9lXyf9V9RnSDmIavbOhB1SLI0Hk5d7sOeCNPpGrLfOhTg0m6YM11pqnsBYVEd5ATNYSxKggqM/7iYywzRCuJeLcdDxQh/sRB6AxSDr8l56fZFatxFVu0K+ZoitJ6rAIkHTM4sUEnsjMlNoOahSPnqOG6hfGsZ2408cz0Go8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fg0Lbud1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B296Ost004838
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 14:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80/5sgkMsINlYr/kXPQp6J8zNYaokD4TB0hvENF9JR4=; b=Fg0Lbud1/BEDue7B
	gB+H1MLQnjL8IbCgVI21PYWkyWnH2LsMaEaICvbP+kEm0+JfYx2v9gErZUBFyRoK
	JZc6ZbHD3ypvfFJsCoVVoSWtBJZXYK/QjW3+W6W8jcHLWd4ORmDui/nV/fK8wj74
	qGJzzLFkJQL0w053rS6EoVUk1UYiqOfnm9w4I/vCHaPkFX0qg10bPk8XbdRHnXvm
	ms8j1QDk2vvuNT6C8cljGAjZ3Cz56YqdqIB9vA3oCyPVKWVOiBuaatvPNpl8h6iR
	W6E2LaLFXywqNzD33+XmG/nveykanu6tEU3vYI+H75VIwgJrqm0AW42w5X8HUyzb
	2mhYow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjvwys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 14:34:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466d3ec228bso4301781cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150066; x=1733754866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80/5sgkMsINlYr/kXPQp6J8zNYaokD4TB0hvENF9JR4=;
        b=EvSBaM7p48h3HijK2ANzRtVhw+FZgTTgguf8XQ/jW/90A0wbpnTRt1P6JjfsBGeH8h
         Dy3sPckqrCr+5JI9W0zLlgIdtrH7eVopWHs2kex4qA96e5rgyfkHlCGlMejAFnF4ynKy
         CRWhPebz2hzkbE5nGLoWsaKemiXaKN/JoKAXSE5cM8lC7KfM4yOZbFRjXn+T0n/Nht75
         yo9uTkGKiJMI2arCcj4au/vZKBk2DuAompXz/4W73eUE6F0839ESeVszibMzRi6JPSiY
         K98G8NpJk3Mx0wPX07KbW6iFtcZsGxMigEfADZpwqyGRkoXSZunLavbh0n9Q+njB3CYJ
         xHCg==
X-Gm-Message-State: AOJu0YyjwW92p4jx2fqrxdkkQkzgIVQ+L5r0YSCIO3qQ3OuO4CzVuBp1
	SqnhYHzsjbSa6WIQHSqU/o7peUOMwFojdjflbVNabTvuz0RL2ud4c1mF6HZujt0T8/lvm+sREDb
	HgJ46GwUWY8xprqeHOze3QSxFhIf6+hf56ECOMxwaMV/rzvu59sAZnVAplvYZQxAD
X-Gm-Gg: ASbGnctrimtP9dthgwBGrtw8UXZBWP3fb+u21x9FqcLC+OR4iA3nWkYLKUcABEpaPp/
	eV+0ie3Ttqz9t7Xh3gpgJG4TGK2y8C5lEwGWfflmXdFXUmb1p3LFG/ILcOEmr2vcHPEkvRi7dJV
	FcDCu3+o6SXWD6Hp1WrXzrbmo3KI6QEFsUVOa6fpeRHpFacNdjCpqsEOb7jjcEABJa7fO6aIe5i
	LVGcu8OqTcoJumWzBpcU4vZGtyfglcmQp1NL0H0NeGU8HGbaDvF3vgIShOC2g67D23eXqxPVEnn
	DjbNihagus9f72LsQR01ATlDeqVHuNA=
X-Received: by 2002:a05:622a:5cf:b0:463:16ee:bd7 with SMTP id d75a77b69052e-466b357ee1amr140651681cf.9.1733150065749;
        Mon, 02 Dec 2024 06:34:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENRJvQcWCDQ4WzAAHZoOdr8etB/4bHLv5UFvCLr0Y2e9/702b7mvH2WM36qkWsenLYrX5Mbw==
X-Received: by 2002:a05:622a:5cf:b0:463:16ee:bd7 with SMTP id d75a77b69052e-466b357ee1amr140651581cf.9.1733150065359;
        Mon, 02 Dec 2024 06:34:25 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996d8bbesm516662166b.43.2024.12.02.06.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:34:24 -0800 (PST)
Message-ID: <a7ed4962-9355-4751-8936-b8cb9d5bf2d2@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:34:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add uart3 node
To: Wojciech Slenska <wojciech.slenska@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241112124651.215537-1-wojciech.slenska@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241112124651.215537-1-wojciech.slenska@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fTc2n6Xee3n-CpnMZEjcsd4RKel_kuH3
X-Proofpoint-ORIG-GUID: fTc2n6Xee3n-CpnMZEjcsd4RKel_kuH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=728 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020125

On 12.11.2024 1:46 PM, Wojciech Slenska wrote:
> Add node to support uart3.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

