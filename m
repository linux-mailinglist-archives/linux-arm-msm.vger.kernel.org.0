Return-Path: <linux-arm-msm+bounces-114717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ceg8CtrnPmpDMwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A06D0230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j2Xcs9rH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CaQAi7O0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114717-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114717-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3242C301318B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16870358D37;
	Fri, 26 Jun 2026 20:57:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D773B2FF9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:57:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507475; cv=none; b=O1xlKVpsnffk4O7KBd9Mzt6dznFI+u9PiW0wEoQji5JojL/CVHQdfX15tvUIoyh0xGzwDEDg29Fkkfp0ulxwgg4QDVLDzHwdPQA1gPR+pKDPc2DITXP97KIB95sa5yQjpRLZFLoiIcU2rWB0VaSuY9Y3ry39ZvJn+yLbwQD7gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507475; c=relaxed/simple;
	bh=1Mlqdx0yALmjRxStf7R8xHxhf5GtiIJdHJ/PGKKoFS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeqjlmDI4DaIknU/zvhi9+7B2BAShkY1itltjPhui+w3+F88c7YOfE103VXMTlIQp3gkg8ZdlSgRwKAHzK0Ilz/ett6Xm50ua660nY1H537zImp77ZfKlzl9uRC9f3a9sNQ6+4jFnPwTaSHBIdmpujejFmWCV43EOfI1Z//XpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2Xcs9rH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaQAi7O0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8XlB2194444
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yd7du5bvNXW9tUAU2kTjwJsr
	b2hTJirrDWb8BV4Ma7c=; b=j2Xcs9rH5ijerF/VZLQstRSueiY1yoyk0h05sPev
	MSHTJ9Lk5WDThq/f+Q55ViUkCvHrZ1gSFVddqPTyD/VBehY43Xi/D7d+LCoq6dwG
	dWA6KkwIDLJkyhfQcDEJyC4IM9pX8Yz2EF6EkMsnsjmXDka+iP7dybiWFt1rjU+h
	J8QFvdUdQYZVub2fvKeQLwTpDY5iRx+SMriiq1u4dUoIupdoLWJgYPNbYiTWCHqi
	g+zD9iOFlbk7GnUvhQSqoT67qSzYoHKmx/AH4QTC5MkKw/OEk4Sd6cadcFVQ3q94
	RWTB+9p96rpqGFkxNjzQA4nx61b0P1iLhyBZ4y1ImeRJpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xqa8f9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:57:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ad11e2197so195298585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507472; x=1783112272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd7du5bvNXW9tUAU2kTjwJsrb2hTJirrDWb8BV4Ma7c=;
        b=CaQAi7O0pJRlDy2DxBfFupchhfmCZ/1nnLmPYxGU5d1SC3DApgZkiS+fRJ5R3SVGG7
         w4a1nZtnDPNPk3a9Fn665leMsRxScPEtzrDe8H1NDTvPkaLDMXEa7TuJ2YFIVEIYVxf6
         3nNkVsgfMgBBQJecAssyuDXNjzW7G2fpyLOuHUs6nPp/noeppMORv26aRjCJajaR2yNc
         xOVsUy59OlXbkuvcJ7AMYbzz/cKKgnGfl7lJKLJnFlMRGc9ozq7q9zoHiwQONP51Yyyp
         CUJD2CsKcmACR5IeofbvfBlkJ0reTG8dYlC4wtA+GKtp0j/Rvwg4wnL746jiu+lNrFFA
         uyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507472; x=1783112272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd7du5bvNXW9tUAU2kTjwJsrb2hTJirrDWb8BV4Ma7c=;
        b=SYqpnWRK2tiaQK/wpVQGQt7C0RrfgymiVli9TYxRNRSi970NcMG8jLqE9dNYd3ZINf
         wE6MhtBFgXUzg8PV2CAbLzpuOCxpeTMXV5BctKNuIsGImLKVgDI3QFcAacBE+j+dKPKN
         7BhnZuj83UUfwcCejVkaBjltCW0fFm+UVLEo7/XiNftfvImq3YVSvc6eeXCZoodRJsaZ
         u2ugvZC4TN+JGoVnNwyY0KQsbIJ1TbjdMJ6DE3OKrf+yLJZto3MGYDdr4fryQZyVbt/P
         oKZPQinNMkD+jtblM99QC+EE5XxgAYLAvcR28BZbyJUqVPFY628svTphfuJKhNjeq5h9
         c7vA==
X-Forwarded-Encrypted: i=1; AFNElJ+KnigmJhP6peveW8MelV0DLpaQPkVIp0HNk4O9oIVgHl7uXzWylvoZKTB/nQMJIl9JfS09bKDL+cXhpVsY@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK7bhKpfCGOYsU1f1drQSCYxTI+DYNCf3Ep7CyaEIn6cWFon6
	LUfxa9fXRdYD+t4XIcUWD859II2uAcOHoCD/SG9Ofzjdda+biH4s8xWosAWM1QkEmdjeyAOe5lE
	G6jhVi7Iij6uPR5Qi1bRHXVbI62Ixjmq6UeYyhiBUa0IRtTA6uwG8QakDvf8VFCg4dFQ0
X-Gm-Gg: AfdE7ck9x26fuC2vaUx5iUadKf90Vz1cpTqpfnD8g5dWM2OZS9i1amQteJPlotODo0h
	m5IpsnGel2Vx4V7Ay3Qxwr37qAApTrKFELzzPfAGvQM3AH9Wc7ErfVVARmbKVvNmS6yDhk2UO5Q
	zbHzqMgt5pM0eUA43jDh7FdXKB3yoOkbi/+pwawZzrGotIqzQTObR5Yh3p6yBaNcwIg3avJrB/i
	/tC4keRU3wAFPTEAWNSmmAS0XdvHVCK0NIwbL5tYQXLbs0E2qIiQ8oPl8/EChDo75+Qvn7ceesQ
	5wIb18GnUzI72cIZ2dpv7+Rrsp5U2R5n+xBgZV5TD7oAfRs9hEZHhMycBdPp5u6kGE5L5b+KWNE
	P16hGtmajAQl8NP+gB6IGFaWzmzl9JrdvR513iu2ji8AVKAmgkeMn5jKdVEPrxMXB+/Q12lseoh
	SWDQW6uRK0q8+PNQBQXgdiUiVi
X-Received: by 2002:a05:620a:6302:10b0:92a:9d2b:1ccf with SMTP id af79cd13be357-92a9d2b265dmr434982285a.36.1782507471981;
        Fri, 26 Jun 2026 13:57:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6302:10b0:92a:9d2b:1ccf with SMTP id af79cd13be357-92a9d2b265dmr434978985a.36.1782507471408;
        Fri, 26 Jun 2026 13:57:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69585a76sm3638337e87.74.2026.06.26.13.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:57:50 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:57:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Message-ID: <obvpvyx3kmzcdc5nxmx4inlpiqugjxdgzfzmdxzfqqy4qqwt7l@y2zyrtso6yk4>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260626-friendly-ammonite-of-holiness-aabefb@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-friendly-ammonite-of-holiness-aabefb@sudeepholla>
X-Proofpoint-ORIG-GUID: rJNXamDT9CV_SfknEgdvtXmyEEKgN2Qc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MyBTYWx0ZWRfX+I+g49tTEZ06
 LsTk3IaeTE3VmuGRXUgy/EycsT2naSlnself7SwuGbyG0G6jsXPTa0J7tBl9PJnQa7sRhNk8s5s
 ZtdWT4qA2tWb5RjzV7bwPE6/MKTnHAo=
X-Authority-Analysis: v=2.4 cv=GPs41ONK c=1 sm=1 tr=0 ts=6a3ee7d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=Fl7lxUCT7PhOQckEiWcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MyBTYWx0ZWRfX5mUTk5zRDMTW
 pWSrNQ1/cazfzr5Wb2LaaEfq7nURgnldhsKcWm7+e3rcXwbBnyz6ObSsm8jHJaSQourN09ym8W4
 pylFWS5p1viq49w1VWx4yN0Qf+DHJxP5FwUgFmoRIaO5zPxhk584ELtHizTY6cB8QaVYAXLEHs9
 j8ryOPai0NLN6/KrhiBRI6xi7KMZPSMm6fXLMo6C+62n+/kVegUdzCetcTEgkL1uztG4oOxnYhk
 xhTdu3k3TlCg3BsSY0XDIA2y6gBYVBz49VI2qLKxrnCa2qRgeX91pYJzw2doNd4a3Mc27U9Bv8m
 w8M1wqO6zs3Rs5a8lM45SDRwWamP+t22560o6GM8xCE41X5uXS497KZA/xINnwF437zJOyw1oKO
 WHtAtDoHRlorBfwFXkvy7YLMiXRTTlSEroisMdHc9moIGJR0pF4cd02GjsG2ab1ffL8ngPOJYaM
 yIGsbJMeWM57qmrMU1Q==
X-Proofpoint-GUID: rJNXamDT9CV_SfknEgdvtXmyEEKgN2Qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114717-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,y2zyrtso6yk4:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C1A06D0230

On Fri, Jun 26, 2026 at 04:52:41PM +0100, Sudeep Holla wrote:
> On Tue, Jun 23, 2026 at 04:52:13PM +0200, Hans de Goede wrote:
> > Hi All,
> > 
> > Currently as soon as the kernel boots with a populated DT provided then
> > the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> > gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> > actually boots using these tables this is not necessarily desirable.
> > 
> 
> I am bit lost reading the very first statement here.
> 
> Who is populating DT and why ? It seems that is the source of the problem.
> 
> If windows can boot with ACPI tables, why is it causing issues for the
> Linux kernel, any specifics?

Windows uses a separate beast called PEP, which nobody wanted to
implement for these platforms up to now. You can find a lot of ACPI
dumps for these devices at [1].

> IOW why is DT populated which creates the problem you are trying to address
> here.

Most of the laptops resemble other Qualcomm platforms, which use DT for
hardware description. In some cases, it is the same platform being used
for both mobile, IoT and laptops. It was more or less natural to reuse
existing support.

[1] https://github.com/aarch64-laptops/build/tree/master/misc

-- 
With best wishes
Dmitry

