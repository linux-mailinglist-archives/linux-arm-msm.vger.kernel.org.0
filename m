Return-Path: <linux-arm-msm+bounces-107575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPbqNdqqBWp9ZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:58:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE3540B2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97397300406F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF0B3B19B1;
	Thu, 14 May 2026 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfBg2xmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZb4tUi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416737F747
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756308; cv=none; b=SJhcN2deeOcvlg/22qe/JTkk9by6xmTHhh0my8m3745GTdSwRcjFpUx7lXsYT81IhsZtQqCKYjrKUtiV9kKA8MVHs0OoPKYQUtmH5eLtSKSROFElqpE5ho9fEeL59ThqRPJ5OfZvs9t4pccC96kVhQs4+7HiXarWm+kv2oPP9TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756308; c=relaxed/simple;
	bh=tio3jV8JncTrXL3lmEiYq6OswxZqEopi5Rr9GvXcxrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6rONbY07GGF+uk0um4IZhTdCWlKouo67g7uKBBFd5pan/mw2i6YYmTwXbNoR/SHrQujAlyYtf99I7X5ThI6mOWsQlp56deX4gh2pJW+kg0H0OHAfUdovkoMSMIvpzqA2M+j4X3oqdwtuMzaQC6UZQtJ9NNWR11bGj4ujZsbnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfBg2xmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZb4tUi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9jugn2463963
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=; b=TfBg2xmAmNv6MCNo
	3ULu9CR4Fl+XS607s+gfLtb0P2kwgxHhbZI/Xt8PrQJHyLHCG/YkcWABtlWJDEd7
	STKXpUYOllfCydBOqNjBeyBDopdbYK5eEIkXbBguUL0QGCN0tB3ehaxmzPzn6ciU
	swp05WR1fTcm89FPZ9VaQtvFslC+PiUBatmncQUbIdzenyp9l5IdNacaI0ahrHt+
	H9UhwXK5pG1riIokxOJabMlJvle+B600rjee9p4UuDih/7tN00aziiUVFAmqq6HB
	F5CUb7z4qB1O0rneqUPEPnJUAwkvYnXiC5MkEdYVDaxM2pxSs5fq49VOnW7leeaS
	l7EpDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v88ysw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:58:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9114b077480so7232585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756305; x=1779361105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=jZb4tUi/VpddjLcYhLB7JRyqccj2oVQqBS2F2AMdcQ2QUt/UuDa1QJlhb7qTyECBl1
         o3z8USSfD2J9WCB7UIJspejMCdIBQBH/CS1olL5QfT/6O5zusMM08UzOhjIMRRbuOhoA
         rPa+y2KMDF0Z9+byyjU/ZEEXBI8rvT793deS0YMLB/1fWChkn+r6iQSo2EIAvkzbbEEA
         EFxFTC01KUdEBNkR/R0NcM/1owIa/3NsNXqy/fuSUQn+tmJtwhO5pae71fYtTIwPbK5X
         9MJqBvdIPJIuFCq7rh9CMv8mE+pFFMewbLkpfKzG3QrKGllsJgbS8UPhvnfJhWmyQMwV
         IRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756305; x=1779361105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=Rhxff5JG8jIMaCJtWZ7kORcgcU5OjZqHJhdAu0gzX3rvKk1T0wJPqwdfUiN3wYsIKq
         HRjHUFPh5KENv0LUb3NQ1tLYRGfIwBMk82QqBAy5/B3eDFKmWBCtemMl6VK2A5n638cs
         lsrfpLNJCYqO19eVsJ2QOr8bXcpZA4OjVmABLGuMpLkIe9ELy/NWblmzVxua8Fw1lJdY
         xFtlsa9WNTcM8vXE7TXYje7wl6zlQVgteYRUfs6ZjdgaMefSg5nxHIZQ0TXMDum0d+W+
         hWHkJHTxOzzPLJ6veycXTtYK1VlWadJ7/oQJ3D94xO6iITHU35Ry5CDiOzXmOw4j8mqg
         3jjA==
X-Forwarded-Encrypted: i=1; AFNElJ9zuS9bKmG8bbeGYKXn6mSZ2KFAUZRoMpNHmmmUZ9WbcLzEZPXHNONa1LGJhnONxHwShXWNIgoxxlN+dDT3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3f+L7hvaYccYigd/lUfBCm8HHpN/pNIRMgfn7yAVCTnrvh98
	wbO3EydGaFZVAvIj4rbG8OlCW6O34vsm022wg15cJBTm+1Ay4hciWR05k/6PNMF7dHNWBZTadzW
	s1X2E+vSmVJ0d43Sej9/I6c7emm1B5U13cm36TB/npRtd690cuFg4h95zTyBl6AicMlGn
X-Gm-Gg: Acq92OEX4bqAEpyNpJzwIge31+YVvdc3i/C0Yy6gMCwxty8vLxfOJNGUy5UbOk/bBd4
	MeJrqFk/L9wF5x+kXQEiATCSifzNKTzp4XU/RsQRjBDSPlWXh6GY0PZtLIfGwVCL11ZhXsgNDEq
	UHw0FMWUEGHW1kgyFEi2M7CxxDBOI2n4/Oe5b9XNDdXM+lB3liSzADjlXoA1+6x8dq35A2MdePC
	q35eO4BALuFZa4avTj0rD5MTMLVcO4A48N0ZUMduuufRlwKSgQxLshhPNLDM1KMC2yWx4bBQmEX
	I0iEuTbJGSN1l/z0WB5FjQ2OJYvk5l9P2NRlHjTPvTHuPUZOcX0rYeg357e1zr9gnIi76Q6MdqL
	rhiqM7mfJINEuPArz+oh0HNOR3r6OlJvXU2IjXMz73pVRKxOfwgWSOs9uPNDLlMHSSty8/+F0oP
	B5Ung=
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72359941cf.5.1778756305310;
        Thu, 14 May 2026 03:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72359701cf.5.1778756304841;
        Thu, 14 May 2026 03:58:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:23 -0700 (PDT)
Message-ID: <c892df0c-1fb1-4cb5-ba17-4b75aa52b214@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Romain Perier <romain.perier@gmail.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX1YsjwwkXgycN
 WrB1A22tyRAgaPdt6xereA8a43wiYSpiR7oQMleTV6Xkq+ms7BpELh8KLcLFRT/CjPmLsTeH24t
 53xzuMcrSEUYeezjJ9fbgxuaGkBv/TVaSoizCian46Ljuq1xmjaApefncvucN/vtlm7zg/eetni
 ZSPv3g5psCTHDkRkcKBktb+7f4RqgqkmvV2ZhjwR/WzvWJaB2e4RGyNbPdZZRggI+t8QDWWnxul
 Ai7hhkZ0pri74rzrxdX+fYWUjSJJguABURVxUNHjSqVyZ1gmAusBo3NbCPH9pLfUUr2FjISC90l
 LROAvN2UVPUs6OaEM6fsd7XgGV1D82HxkNXcBnqcNttmjATc4a4NeUBoO9xeOAV2Oc5IJ9LNZDT
 orHGAAhMrSWSb6qxbQrd+/AQIdNeDtuxaEXOVnfteZ7MA/lzXjLbeTvRSKF+WAFJJ1A+lFWjzBF
 i6OgUF/hRQsi+cFqrAw==
X-Proofpoint-GUID: FfyYDoBwU9wO4M2B5hLmIEZei1pwErA2
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05aad2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-ORIG-GUID: FfyYDoBwU9wO4M2B5hLmIEZei1pwErA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109
X-Rspamd-Queue-Id: BDFE3540B2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107575-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lumissil.com:url];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lunn.ch,bootlin.com,mailoo.org,163.com,arm.com,sntech.de,sancloud.com,foss.st.com,sartura.hr];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
> 
> Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Assuming you get the other backwards compat pieces in:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

