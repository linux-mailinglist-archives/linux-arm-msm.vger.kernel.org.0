Return-Path: <linux-arm-msm+bounces-117885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZfUuDddRT2qHeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D172DE8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fUmEcQ5f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBImtEa0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF803003E90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BCA3E5A09;
	Thu,  9 Jul 2026 07:44:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615343933F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583099; cv=none; b=d+uQ5Pxrk20e/eSWR++a2OjDOWJqfAEzXEXWrEOXgy6KvAaqD5m2UMc9xenNrsRafZrAThzDUCJC0FlFUUffH7uiI7xQsL7lMtLtKklygNUO5Nf1LLGSiE3zrwN+IKojyFX91V2OH0MZK3ij0mF5uS9KXIsibz/q9ALbwgMJAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583099; c=relaxed/simple;
	bh=LDfUi4NZBgfLrHI4B/s+P1VjuEhuEUnOiCpkxRIJFXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSQXcloUmwd6gJwmb321ROGHJ82TIWk9wJg37Urewg2+LOh7fg8Eipn2HV+7wfaNPX2c40QZsEjdUAvZdZLZjzbJCi8zgHRKXBJGpOHFdcVJVqFoAihh8/thxB2JdcxPgJyjYXxYLCk7SF2+8FQZmv9WqKJzGXByaNtSYzg46XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUmEcQ5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBImtEa0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696181U933324
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67btAJqJoA11VZfNhZNlEX7T
	AwysL2FeNXAbd5m6mXI=; b=fUmEcQ5fNrKMRaFMON+9uWDyKpxaNZ2wmND69fld
	GuMkYzHrEMJcto9pWUifWxdW9+y/fA5OIeOggFBHDJdjrMWqorB5HhQtXBaNUAOq
	9kTtir+0a6B8kylB5CpSCEgZQ57xystTcExxcPDnjdLeUNZRtrlvO3pLUsVZDGDJ
	2Al8gSp8vtb/6/QeTbNzvcbrvCW9DE8i/rIwoSOSTSq3+BMmweFudEPHIP3pwuN8
	OOMhXO6oGjh5aZ79iqOrarDTcdQdbKh1H+7pfyn8A9BPtxS9+FxlWKdHYPN1+WaD
	+EzjtWG4zRyvDJ6Ji5tN9cDwhMg5Du/c/pVzCNQAANuetQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jh94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:44:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7cb9f24so364661137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583097; x=1784187897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67btAJqJoA11VZfNhZNlEX7TAwysL2FeNXAbd5m6mXI=;
        b=HBImtEa0TVu785iY8mLdUBUszgZvEJXZE45HxdRfYFIvJ4+A7C9ac10LqeZjWjfUhI
         a/n42lZBR1HSk5fhZa0JadgqpzyorFOQ31wSPHqkNZ7p/y1qb5hveo1K0i9KDimi7tVD
         ylbFbq/qreOZxJ1ZsbVvkFmNlDTFlRKLckchjbtzE4hY0C6tOy4Bzb6ThWy4mbuwqOmX
         0PnrJBbIhUMleCu5gO1JNyevJ8eShfXVrHFM6+rR1AdwS/hmmVN9vA1yU9CPU8IgyZiu
         eyR19pjyeb5TWvlAXIxxhxify7N4J9RYo2qdf1NsnLOwx+lAFCmie8ldtt9mQSnAC9LI
         6TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583097; x=1784187897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67btAJqJoA11VZfNhZNlEX7TAwysL2FeNXAbd5m6mXI=;
        b=Arm6ZhMJ27AwSFta9/QkEXyGbBWW013aRCRUidXwO+pClTwAYts5FNv1uQkvB5sMDj
         fAF+0CDh3jP1ThYARJ9O4ye9q2bgtPbCUr3AQrKhEHH00ts6FVykEBZrWOpiUJLqLvk9
         jD953dCi5yfK+uDH82V4cv045p4cvXjIkwZyb0TIfdLFd9B8y7M27uI3h7ezGxodtZ3t
         heTNwDh9Qd/XL4lXCWCYYCUHpMssI+067JrZ6kn7wqk3Dv7eXmDyA86kM+k3fksDGW5f
         v9GXlKJlfIaWnpKiV9uAPys2MQwlqjNk0FcR98djbDTzKomuxOM3HEn7fHp28uemRdPK
         dIeg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2wXyE13NpkWtuRbtIQXsIseCZtwwnIm7vRkuIzL3WPtFxdQuxzQoWI8WTVg1Dhd8fjvyrjmNZKB+V0vGu@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnOAOxYrJoLYFnz4b+7HV2wP2T9AJmfL4rp/tgHkwRc+f+Efb
	bWLlBjEGHEihdJQGWMWtcDmyFxSD9+VEcKTmBdq0oE+TpIhiY7G7Z8RycCwgWb2HMsH99Ukx4MK
	Os24ZqchCI9NzFZ1K7gk6kiem2Vi5Huw0G1fo8Eyd9Q4eygO60N7HF4JrP3k25AlhZ2Yl
X-Gm-Gg: AfdE7cnwtmYeJcI3oIyRTEZmpyxGHBMFLCZgHvjXPWp8ywfoa7jOi1hShEx+QjoXVJM
	Ugk4rbU7RUlr1egGAw5hyySUt08v6Ubdulcucy6npQjfpjua7GodvpxFgcE+YWK0dkX4BMfl3mk
	qb5NG9fbgu2eH3T7X+mBoOVGloCZCR88AEl8q7CVZmZjhMdY6rbMD5gcSWL8y2bWLB4JDMINXhV
	ubx6mGjbO3SbKmL1PYN9DfAtHHPhQWM+qL88BiCQC8/0v39U8RUOe8zFyNjukkF0Jy2ee51mDpK
	NlHuNl02TAbpMuMKONdy8OHRPNTvqlN3M4pvP6N7Hqbzwhbtu5nk+237OpqoauVV7+O6Lq0TMkc
	9YOXh1Ihd1cN5/8hgYyxLkbaTEZIKFpu0INCNI4CnFlZCnOXXB+vPfsN0OBNY8nmdZ5ZNklxCN9
	PCFu6rYXV5q9lTTil2/9VTQ4Xu
X-Received: by 2002:a05:6102:5122:b0:737:d207:5608 with SMTP id ada2fe7eead31-744e00ecfc7mr3803438137.21.1783583096735;
        Thu, 09 Jul 2026 00:44:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5122:b0:737:d207:5608 with SMTP id ada2fe7eead31-744e00ecfc7mr3803414137.21.1783583096218;
        Thu, 09 Jul 2026 00:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00cd21ca7sm1444264e87.56.2026.07.09.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:44:55 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:44:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Message-ID: <vpsczyjw3ew4lhjwy6edzjomryna7ygyamgr5idw2aiq7al2lh@64to3cet3ufz>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX7LUxpcpSEcpe
 ElLi/LyiRu7PhuQKlV79wX9ERi+B9+K6+NXGttSznsegPIy9Z/1dyeqOu/Mny/ge4JxdRACmOLB
 3ZuoDq33CwMs/h3I1PwInyNHNd1A/ys=
X-Proofpoint-GUID: 5g3-EQ8cWVfiOyOqM2aDs56WMvEIc6Pu
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f5179 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MVNNC7U5w37-LmZrIMoA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 5g3-EQ8cWVfiOyOqM2aDs56WMvEIc6Pu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX5ufK2pjggDX+
 aR4ZnfFsEG3r7oDxCaqHmkKxkVUA9TObiFSuS2ypB2Z/uO4BzktOFp9BCXBOyKcUizOVPlsIk/L
 bGkrT71AhH8AgP/LmfxRzWi6jFGTHVcIj8p8EmS10F2sAEU8DjW7eki4KmSuA1sDcr6ZDy6cQRW
 vrO3W/L4jZvQIs0ExqBFAExNbfqQZrnEyO/Axts/8SC7S00rx3DTTQF0KPW/1LOghfVN3lVXfCS
 i0EtjGcYm5tFBGEG6Zp67rKAuNRjE/l6ngUoQYE+2S9wnhcRg30Owzrb855uyrUHHce7itoMyFG
 TApxfzoidYhxpPZyq2JtY8XPwtlKvgcq2wvKBJQaew3Ozm281P9YTx+i7zucTzbEBqZWIl+U4Kc
 9nYEzSzYmB2q90ohfhSqPUXhLVn42N22mZqgP6o6az4I0j9lMtbfCKmTaV4lllVsI7teQYfvc5g
 em+cUJX8C5c8MIpoGmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117885-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,64to3cet3ufz:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 715D172DE8F

On Thu, Jul 09, 2026 at 12:59:40PM +0530, Wei Deng wrote:
> The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces.
> Hence, describe the connector node, link it with the PCIe 4 Root Port
> node and replace the static BT serdev under UART14 and the
> chip-specific wifi@0 child node with graph port/endpoints, allowing
> the pwrseq-pcie-m2 driver to power the card and dynamically create
> the BT serdev device.
> 
> The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> (GPIO116), both described as active-low GPIOs on the connector node.
> 
> Remove the chip-specific wcn7850-pmu node as the M.2 connector
> approach replaces the WCN7850-specific power sequencing with a
> chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> 
> Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the
> PCI-to-PCI bridge device.

Separate, unrelated change?

> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
>  2 files changed, 47 insertions(+), 83 deletions(-)
> 

-- 
With best wishes
Dmitry

