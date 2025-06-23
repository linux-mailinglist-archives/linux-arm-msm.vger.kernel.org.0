Return-Path: <linux-arm-msm+bounces-62035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A863EAE3D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB91F1676C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A3D24167F;
	Mon, 23 Jun 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imre8swn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A623ABB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675206; cv=none; b=PniWLjWyvh2hHu9B2Sw0VsYbLbMJUBFyi2Evk2UTdLQoRoUFWVrwgxHhGiekF1v+AAwG0FrBNrdhr+6ugeGs3IXuw7sJcXH3BKnOXAzkAQfylUqBpmhShrn3qg+XZwy7inXkDr+TFNsnyQkNf9HK4WrppbTHBpdn4kJcMoYla3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675206; c=relaxed/simple;
	bh=S1enjDC9x+Nhhk/WYVu0T/B0BKxWkP8SDj/KiC7XoZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERIPdQyLJ6HTRLw7+fmrCyqLdE1R4gWmHxU34S0vGdnXHXIbS6MmHU1O2qG2CWTg2u1sF27Ej2+Jtp5jfsSvZ1XJUHQZardbEuAZN+i6esqUn7+D7yB2j3xkQmdenb3pHj2KhN6jnFTPBPkf8LwswFOMiU/pM7yhuWNsZX9Me7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imre8swn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3fABB031297
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b897uDaIaCreG4v+8lbAuOWs1ae8x9oiX94nWUbXM7E=; b=Imre8swnv/9RNJxf
	LOqQgmz6cjfuXFVVwK7wNsP+IuRXoEcGMcVo8Zun8VbHUH4+LTU3w5WDxJlfpiDX
	T8177RLm0zJyTrkRadJBU1td68p7jXoRRQfLWyXsHNKaq4gujb13tSY9bTiILiPd
	OAErLJV4DkVqB13HY8vn3Nypx15oaPLrHwI6luKKVzgOFzXOg5q0ymUlvrT3mdDd
	3Dx3mPRm22CrQSBHiy9fa+O6MjFOfQmkwj09PVGIc4DoaNs33KEGjhNu6y7MHs2E
	wYnD7l62qIhv43UqynErTdXc+y8X2UW5LmIufHr2vwVqmAcdZZlgpXxrrLS2k/DS
	K8QRtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k13vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso148483685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675203; x=1751280003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b897uDaIaCreG4v+8lbAuOWs1ae8x9oiX94nWUbXM7E=;
        b=iAfApU7FwE73XgUybJDaTPXG6C1TTQE+nnk9qHufXt8jnBccJlQZjUszV2L3PK0a3M
         aO2NbmyjQpQPUgARqnHS/Z8cE4BbFqBy1fPmmDCMey6Ae8r0dkL09bU2W1i6C+Zllx+h
         X3caEm1A1CpZ8rUlDYtuG9tQ3/IE4Ree76YWhX6DXxxSwbvPLxuRppxVQoS9CzQ89aYQ
         p4p+hl4WCqOhAHFkMtuoxdF2M88/3uQcnPoRsobXwDdfqXIS8sB5UWlC+TgzmwHnPZ2Q
         dvHoyCd8p1WU+Bm+qCBMfRhVAUZbBa53KCoTpgURi0PPayfhxvjQbVT+XmoW03yFV5xc
         1ulw==
X-Gm-Message-State: AOJu0Yza5zdHtEUlxPrZSCxuz4md+Um3djOuB+VzEeqJhFKBYfFja3Nx
	8mGfx5ce8/qhF4JUU3JajU1q/yQD8kd0/RR77OUDhYFApUG0BUirb3wg+Jr8g8bzO+m/ctymPcb
	f9NiFtdl0VwoA21xZxQH6naiQisFfNSwO/eo0jdX97X545jTIOr8SOAMhtJrZp99dWie2
X-Gm-Gg: ASbGnctzB8JNhfm9HGZZvAR+PlCFETjnU7tlIFDjUZeo4/kk+Z/fvrrErth5p2Ejv2h
	O/nrJZjlEqr5682P1NbiofCouXsTnZUjBsDDvcojWoz18Q620mZJkThfgk/MSfOCV/eMyoUsXpz
	a0bgbaEVFOLSm/8AzXItgpQFDCFX4envjWQuW3BlgTXJnfAz7UzgOmZvkZXUAJr/R9h747lroP/
	hyAyEGRramCqmzxXLA4OENhTBg72SL/ViNwyVhSOK3IehOjKBt6KF6lYXs/KIswW8NeK8f0Tp50
	OlWz040FgcFJjmoXZogQqcuY0tYuhWXcCEobFN+A1l5wU/vYywOgvWUvFvkCbQ5koa+zwmsdAQ3
	OvGc=
X-Received: by 2002:a05:620a:192a:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d3f9952489mr622002385a.13.1750675203230;
        Mon, 23 Jun 2025 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtQAJnnfKFDS6GPSBOdzMDOqFNoCOeLhMyFw5pPwCYvVfetkYScS3ixGZVRWzJvTvaV87slw==
X-Received: by 2002:a05:620a:192a:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d3f9952489mr622000685a.13.1750675202761;
        Mon, 23 Jun 2025 03:40:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bcec5sm694809466b.143.2025.06.23.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:40:02 -0700 (PDT)
Message-ID: <595e2c2c-8c85-45d7-bba1-5d7765e60e5a@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial
 configuration
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-2-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-2-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68592f04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=v7w6ZsX0F0Nrasn4spMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: ot1pyIyf1oX0I7g7TaQ9obiQFNbfyTt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MyBTYWx0ZWRfX+zpourzsmwEX
 HIMHwF9XWTyxkCiBA+cafWsMNGuVXQoyLnBkbqwyt++MAe/OQIWwd52U+ByapETyesu1mwO7wQR
 EHQYxjeD/u5nIu91pGJhuyzjhCjnzBQmc1WjhEIzfiyXLnY9TQez0TXDJUsNDun/SRE8ts2Xxn2
 u4AHwFRL5hiMYiL4PZZ1UQWip2KxjAtscy0zPV/Zu7j/psc+WpwxHFvI7M5+H8dONQIko00DB4K
 dof8VW2SlXnfFjcr1D9cxjMlwYkkRCJ/O+BWmbma2RTm9Fd5xpA1Uuyne8fD2M3JLLYyJYsP3+O
 SkbuI1XSZXxsDH/zdxWH6NFq8pV9JFiq43AMvw0aPar3HPYFs0HX3DN1BsE87YPa0AN6XaJuY9Y
 BF7qjQr33o+dXpfTEzql3dTsQTeCXANIXAhWMBnrJDtDrXXsW4jIF+evvotBpblYBOsj0it3
X-Proofpoint-GUID: ot1pyIyf1oX0I7g7TaQ9obiQFNbfyTt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230063

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> The LTE variant of the MSM8960 SoC has a gsbi8 node used for the
> serial console.
> 
> That's if the downstream kernel is to be believed, as Xperia SP has
> a serial console on gsbi8 even on the non-LTE variant.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

