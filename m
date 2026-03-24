Return-Path: <linux-arm-msm+bounces-99589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGWsICRewml5cAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:49:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76F305E39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CCFA31F306C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1718E3E0C63;
	Tue, 24 Mar 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxN3t54c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Opco2pbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB323E0C56
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345042; cv=none; b=TnNw/RB0ajNGhyn2ywKX3j+DAu/ygAWCBMfeyg1Pz3KhIhDvvP9WWUhq58nM1xBUEiBjcyDLrerVPsoVEY2O/v4dE7pryQEchqWh3eC1hChJXZiF4q5QGFmIa3IS+7Ch2F+t9TBadNLbcLvXSi4zxJ6smtVEUUgtSOWHTrqDV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345042; c=relaxed/simple;
	bh=eZLFQfv5y1YWafFhvVrbhSW/9AxjMMQ+qGknRyNtU50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJW8yx5G2wsq1sdX6d2OXMYTiKxJRIdCY6osklmQdkWKU5qjW+Y7q7i31SCO8LGNQ0U8pwPyLw7a3P32EpPdGxJjLMUOfB/XTNx46Q5b9QLkwAnWx0d35BXg/rVOA4QGNGdXKSrixi7dqVqVRK5VXiTeU3RafEjw8sZLdOX9rRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxN3t54c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Opco2pbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9PR1b3934924
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=; b=WxN3t54c1D4hnrqO
	m8BT14qd2r+obUGGhF3jaMcyNz3OE8Eq+HwLnvG8pt8rsggDJBzm3n2Ij+f4Fwf7
	R5n533D01+9cNTG0P/UorZeYjivvgsHCY8uvAFaLQwrBm2f/nwcIVrPu9h0yJVio
	dRo/TXaV6it9KhEuESZiIirvxefkfsVEIHbzIRuUrkGoseYrHfnf5CPOWXJKH5a/
	1sIAAA1kgtaveR4rzRsl+qA7Czkg0XiP2B/pUFWAeLeQbV2JrWtFqUAtmCmhKK53
	8N+QJzEZS+Mv5TSU0nJDYTu8rzMfjISlUZiZvI0dZur3RqBMlA5kBorEdKNoy4i8
	whPzFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0krpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:37:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so221368185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345039; x=1774949839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=;
        b=Opco2pbFFfkok83gJd+Pvn3iULPBwmMonohhKjWiNYxGqUlVJ3Yo49XIXVxK0/ydzn
         GSu69j2OriL7nv5btoIMtJ6LeSm2p+zqRHI5FhmQwXwOKEUpfnVKgI81ctGlmBmmxBn+
         dBBT7VoDA5Wa2VYRsQYr6lmsJiyv07yeiSaOCbLU3kekq/7t/X6kOexD1MGgKarbmJcB
         s5lEpne10ifDcz8vEyHorvX+gx7ftpuBBg23QzEOquZOvCZsGQroM98MBx9/XxX7o+4m
         PissSmkU+O5D4q2FbcApWuFF4rtZzETUKA6bCS2LqzfxTaT6os/wunQnqj4/JSO4PWzo
         VnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345039; x=1774949839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=;
        b=kPJ/rr9ewidgp+9u/YiOUBVZbaPxI+FRLQoWQW3CL6miE2UzPlkKTDS1/OipGEDL2h
         Rytf6B/0THOPwu981vSTnBkNfa+DduFa1iUzRP5oqJB54d77dly6lTxCbodD04Azs2Hs
         TXe459kU3qtPLIfr/we2KqavJmNFCKSbnrrJETay3Zc2waOVAUNa0UoVNug5UvYNjQSv
         JlmaIxgWiFSsxboLovnKK1HCWNj3200XafNwNVP/mwXZe2M5iU++p7e5TDdjT9cDLVQW
         D5UnRfixm+kMwIoOlB/Cb6fw0ZBEf07Y2PgwCeTbZZ1M31vi38Mbpu/h0BHnvix8rpBl
         /d5A==
X-Gm-Message-State: AOJu0YxCeiunZmZ5wPNsRBKpl1yohD8F4BKRMJ/yZmJcm3ANqwB1bEKG
	ZY76erqatm3FCpmPFGDN0B782RbUHCSU0OvGgDc08XXzkEJTQOU01By117ZHkkGK1UagZZMOIbn
	hh2dX3M33MhWUeRBQG1+tV4vxKjdqOou1mMRGY7ap+NlLjKj46V5NXKqOHRg0Gi5Ffd2V
X-Gm-Gg: ATEYQzy6wema1iNoRhHheyVSRJpGUs7pEG0/TqVyKfLqg8bWcCVdDM4w/8C7SlzGdTq
	fhqFVk2aNtwV5BRCwKJhHLT0WOJiDum1qnEW2NX8wVD3hA/X7LtH038My1WIM1z5MjBC9dLHDxY
	amVw6Sh9u8ufY5yro5qY44j62iCpLkolhhXNAX3oAQBsJ1I7hat0H3pxhwA3Zt1iBfTTizjWpRB
	m7SZ66JQR4SSEaMZd3gs0sj30/6LPGnT9Z5wSun8UsaMJpU5i6V6OT6I7ZZ6+Ewkw9SBOfnT4UZ
	QCOq1frLhMZMpxe/iB250sJfW/dmZL9xb+MDV7EypcsIq2/lUNh2BGR9WGbPnb0uRZkOPSogQmh
	+88MjlweSji7U08SURId2b4uh+HaPDDI+62jN1WY1j9y8UVx7QRX4yaF4/4oYh28oTWfkC0XTAX
	JSo6w=
X-Received: by 2002:a05:620a:46ac:b0:8cd:8c81:4b1c with SMTP id af79cd13be357-8cfc80ca448mr1473763085a.9.1774345038970;
        Tue, 24 Mar 2026 02:37:18 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:8cd:8c81:4b1c with SMTP id af79cd13be357-8cfc80ca448mr1473760985a.9.1774345038471;
        Tue, 24 Mar 2026 02:37:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a36996b12sm460342a12.25.2026.03.24.02.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:37:17 -0700 (PDT)
Message-ID: <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c25b50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=A4rZZFmT0VfpKD8yd_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX4Z4s6b1yipTR
 Xe8oYbiw4rB6keiG8DOOFWKNcJ+ZGfinaT2VUdeQLqKXzvqpQ+Gws0shyVQts7rsBLCGj93AWvZ
 YYoNd9cquijb1HyoGC2ZnPeMMNeZC3GFsYdp6OF2D2h3QeXVDOxbpSxds2RLCTLzQy+hEBuAI70
 zBMSllTDq1Ek0KWmZxUN0uwXZaj5z3tqRuJhdZnhU8ygc3SNnvPG3aAD8SAEcZOwv1353e37v92
 Yt5rYqgUqYD8U0kVLB/48N2y4lYNRdqXJLgR2qn/aZkqYx9io4U6cQmuHQ4uFETvbXm9hpFr2c4
 txEVBgMIDVeQSBgR5atvuICo1UwCoDE2c10HUB1eUjwFFT3PcPjmlPK5N9K+FERN3+4z67K4awB
 9y249D3QDPTaHJp+hZ/A7zdM9zf0eAbkAkF33JOjlBjJ7ZE6Y1hoJP+S5TPJcGjqHn7OW5axbu6
 dYwfLh4YRjjiDL96MOg==
X-Proofpoint-GUID: cTuxBhyJftkLonPQOKIRDbl1srP8La4k
X-Proofpoint-ORIG-GUID: cTuxBhyJftkLonPQOKIRDbl1srP8La4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99589-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF76F305E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:32 AM, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Dependencies has now landed, so this provides USB Type-A and Ethernet
> support (when renesas_usb_fw.mem) is present.
> 
> Missing from the RFC/v1 description was the mentioning that unless I
> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
> 
>   xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110

+Mani another quirky piece of hw, perhaps?
Maybe +Krishna has the datasheet. does the it talk about ASPM?

Konrad

