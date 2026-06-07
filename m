Return-Path: <linux-arm-msm+bounces-111621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8r+XFV/kJWoINQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D2651B24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DOZ82F0S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kB1RKbPU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64ADB3005663
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFBE318EE6;
	Sun,  7 Jun 2026 21:36:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D22772D
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868187; cv=none; b=ZdY3Mw7EDvN0QD6e1/rAYf0SZiUG26SdQQBC7Mj0L33sKui9N9wcA0fqOp9v5bEZAZ/HEd7pnnGTF1gHrm7BaVcrNmsMniW5udAUI7Xfe5CKAbky+SGkIHxgyzHFsHd2TAio6AjrKZ8ZijhrAL+OHlB6vJ/9fFdmTRIEtobbE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868187; c=relaxed/simple;
	bh=/03ov1eTTK1DiBCXN0jMeaUGcELnRBbvrFZzLh1XUGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDxYgvzgzopYyLCFyZkdPCu0M0/f4TH8SI63Z1R4HXAyS3QbW3BtaaHXPwZLNZFZe6CDd8sf4rHR/T+9HjW86w/dA3jPAtn3G0eWcUXuhVfrXajUqQrTX66xUjH7LPXpnH40WOF55gkBZdrT7Zh9JSxv8ThmpdIFdFMy7mLT55U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOZ82F0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kB1RKbPU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElPge887115
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=; b=DOZ82F0SaAAevnET
	SLhyrXl2ePCZ3Te4p8hOd7z/OuTzxkm9zf4ZwG4heZ6mTWUejc8tsmHMnQBKwapl
	5NJGanaemK2cngOOnzSo+hkm7vRO6mjrBx/aFKjiU7zDjMQz/MbVqJQlYc55K+6+
	GK8os2ezm8MnOFz3PjQIFojnefZjJ+HeZLc6W8r336dGmlGn4ypVQDepgC4NoVNM
	Yw5QzKgDVNCywuhoUNccZHRMv+hUHRLAri26VCbjz05mToREIppQtuk94mOdcu54
	eY4FTRb4AWdjEI3Rehp/ozSVCw2ALYsX3djYg0gbPSIIlwEn9E2BoO7RfMxkZv6C
	5/cI7w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcvdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:36:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ec1fd295eso2060540e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868185; x=1781472985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=;
        b=kB1RKbPULMZHiikJsHwxvX9kc0SU5x3/QRGfmRW9PWqO9SjXd99x6nxOdI/YJEFPol
         Q1/mOAQvJpYtwFiCSkusDHg5s2k72SaCAJEXqdOdcnA4thJQKPa6kS1mwPmwVQ9CjR4l
         AYb4FwAAkcbZvoxR4VLf04t/JNtE2zEKXfMU5tsuc+U3Q61wsotapyzujiZ4Pag/grFN
         FUM+/lqA4Kdq692YRQLa+RqETO1ufTz5wtHquhB0B8dxjLqN0AGtWXhF6RX3QFIU8jsi
         J53XSdHETwPdPOymIkZl7fwVNAWObjPnVPtngeOtCfhkbQD+HHdycGFS+QRU0Oe6yZiK
         6aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868185; x=1781472985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tO+tO8uWdRrldlD/2Mx3L6b66OgpLZH/gFnbaeFBpeM=;
        b=pHb2ugz5fUbqvM9nQYa/RI+g2WbwZ0aJ32AOhYouGPuUksKMd6abZtDsO2lXiAM7G+
         PdUfichqoVa2TjZJo6bdhVpc2OjnUST7SZWiHtML3g0eBuxV+hu1QhMrHjffNtt/Ax3L
         GUnk6GtAnQHRm/WWTQ993F7n98S5se5aKKv/jqXPIqZH3MZmMz3qSdHdjm8MiliIOpbR
         40cMw4HcCNXAxjP91F5e1/qS8DMZRotCyT/CZZJq+91zMgtYSHfvEWV07oWVM7ia1yct
         7lWROFBsXcI3AsS04OcmW/HJFN/fkztO15YIX3oN+rNRFiNTi0PiUk/bIlvadbe5Ir4W
         nU0w==
X-Gm-Message-State: AOJu0YwErXGfzhlwraFZ0Fq1JCqEwMIH7kETL1AQSEYP38s43SVXgb7c
	UwMUO17g5jCxB72c+9wQRSjb04uZFSQn94CH9S3vU9Ob7eEYJjTRmPH7/lKKgq8mZ+yFccxsyPX
	gU8AQeo66iwugpD3LkLHxtwQ4nXQtG07YCeBprjt9hP+ZrgXnTjbZvye1cSqpCOddskbS
X-Gm-Gg: Acq92OEiToNkk+nU1ztBJhttgKzGRhXeQcmhROXWcA9rn1DO5cFr0Jc67b7GJrtI0gJ
	9hgEVUkugCXY79jKk6TXpFkCuyoisi26Lou6qHsGg/s1zdns/cb+ozTbRjmfJib79O0RwLHo72k
	1mzjIh+HnQYD/XFvj4JVixMI0f3s6eUTC/DHT+ywXl1XMtNA8OZWFgomxOdvsNAx37bZvB//Myq
	K0Py5G9N4oVuiv8Npc+cAWaYIWYOtdAbvIPyqN8x2geuzqUJzrf3KeN2/rMDrSNJY4WMwLLq1v8
	v/rr4qu3+RG1raVPfYJV1L6vecdTPSLHfKhSx3BYVMVJp6lOlwbu4Bjhs6vreYfjfjKBNSxBmLe
	wbjQ/lJaG43p06lkcpCWDGTPy4Dj93CEniUmOM+wIMJ0FmcNqIJ3EnGjo/LgyDF8wjKNH6E8vis
	hhJylVc1PrSsX1Gl96/+0Xc5DqQR9RNJieqsEpFIUi5rMAZw==
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr5672144137.17.1780868185053;
        Sun, 07 Jun 2026 14:36:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:62f:39a9:ae67 with SMTP id ada2fe7eead31-6fefa8ecab5mr5672135137.17.1780868184561;
        Sun, 07 Jun 2026 14:36:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b992a66sm3254744e87.74.2026.06.07.14.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:36:23 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:36:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
Message-ID: <wg36iuofkugowcfuxz6pzooatjbei7so2w2cigc6ocnbzhktfg@r2bujfthlcm2>
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
 <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
 <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
 <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX0m0CDru8UIue
 cDaLexC2yO7LyY8tb+lwsOxzdrNiIxXxkNea55g08zSGm3UTsI0Ek4kG+sArC4jyUD+cS6M79XZ
 54xfIErPs9LSNvqRfgEZmXyT4/0S+nVOUTf051CzQjGowpdzOLdNbkYP2hoHtZemMY7YuN/HJdE
 9LGMINOXIRaRtdFxWBC200ID6Bj1fQsBUB/OhV0ic1Ad7ot7U70vbvfXjNJvoZCSIAWBryVQo5F
 xBSpJ2cKVHW6YsQkQVxHaGS8uZIctIfY3zpu4eOV7DMI6luB3Wev+Cxbikyipe/puJZWvFdOVfa
 XWMDiip38iQU3XdjV+7iRs9e5YnpZnGDkM3BAmo00/ypmvfxfycmcDUqItw5wwJmk4tUMTcOEHo
 bd7+nCegFysjqLnVS37vFL0eZ3/Z/VcxKUAoXyCz+VioB2WbxINnOnZGw+A06eyhxLC96Pn6zhU
 vwpoe+tW3Yv04Ew/gjw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25e459 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ql0nBcLY1XnH6QMhr6MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: x8X2OHixwlv2bU6_o7kuY3j5N3uQR9eh
X-Proofpoint-ORIG-GUID: x8X2OHixwlv2bU6_o7kuY3j5N3uQR9eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111621-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:qian.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C08D2651B24

On Tue, Jun 02, 2026 at 03:03:00PM +0800, Qian Zhang wrote:
> On Tue, Jun 2, 2026 at 11:32 AM Qian Zhang <qian.zhang@oss.qualcomm.com> wrote:
> >
> > On Mon, Jun 1, 2026 at 8:39 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > > > On Sun, May 31, 2026 at 5:09 PM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> > >
> > > > > > +
> > > > > > +     wcn6855-pmu {
> > > > > > +             compatible = "qcom,wcn6855-pmu";
> > > > > > +
> > > > > > +             pinctrl-names = "default";
> > > > > > +             pinctrl-0 = <&wlan_en_state>;
> > > > > > +
> > > > > > +             wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > > > >
> > > > > No bt-enable-gpios?
> > > > BT is enabled in node uart10
> > > > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com/
> > >
> > > The BT is powered on by this PMU. So, if you are adding PMU, it should
> > > be used by the BT node too.
> > >
> > Will move bt_en from uart10 to here.
> >
> > Thanks,
> > Qian
> >
> enable-gpios in uart10 is required by qcom,qca2066-bt.yaml
> and cannot be removed to PMU.

Then fix the schema (and the driver).

> 
> Thanks,
> Qian
> > > > >
> > > > > > +
> > > > > > +             vddio-supply    = <&vdc_3v3>;
> > > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry

-- 
With best wishes
Dmitry

