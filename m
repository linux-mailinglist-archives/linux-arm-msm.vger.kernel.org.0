Return-Path: <linux-arm-msm+bounces-111043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C0CbDCJ4IGq+3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 20:53:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C565A63AAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 20:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DSSI+Cfa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dhak67tu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111043-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111043-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A424A306E509
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 18:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8522247AF42;
	Wed,  3 Jun 2026 18:51:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD547D94F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 18:51:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512709; cv=none; b=IOOfi37FsgxrSlh/YY4TPJxFF9pQaxtNyMrLPpA3EZUvOIq7+eRIcwAqKEgX5kaIDcwPobRMFsuLaLs2a0XikPWRqXA4BYa1x4X3p9mk1g7f49B1xCLznCoZdWiWk9IGWZ/9eWMqa7scOKk28vBFnn16zyxNP0Zzej+QN1QHJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512709; c=relaxed/simple;
	bh=SlqtCY60mHsDAVgQllPjTztuC7AhA5LchoyFVMWeoAI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cWr0ghEBICfilzb1esAhszPHAZyonmTRJfIw46Djtbz612IQjcrvDRdiy9ebGFBir7C7QjtSZtSciQoz9BWCW3nZI6B55lzlEpLmzWeC5I4QdmkzvglFwbFjk38oKqsyOGV7h1UO8zByPgoY8el4N/K6W1nrvdOaH44Z9V8q7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSSI+Cfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhak67tu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HA2La2651252
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 18:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=; b=DSSI+CfaYqpxskZn
	Rjdu0PKMxKG+Uyb5wU5NB9fqm72SMVzbOmy2uhC5y9v/y+sCaoGLbzawaI459RbP
	hoi/XvgnEXXW/2ssP3yYhRcjsvLsX3MfeoK0vqc/ySRCgF+McqG1MnlU5mXZ4WPX
	KNS8sC2gxJ7tN2eDYdrTDeKDhl38WehZSfh+tC2OCggjSosgizvYsdngF2Gu0LtO
	QLltNj/mW7ziAPRoNPpeB1ySABpukGjr0OEWQeIuFwEn5GrXF3i6N9BD1KrbV8l0
	PyFseuIbl3VM1V6nkXBlSqw/7K/jRsNHMs/RoeO6Yzu7Q1uQyR7Z6lIbjypUqzd0
	oKV4Dg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejre9geu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 18:51:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so5195747a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780512706; x=1781117506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=dhak67tunAJjuAMrReSHbLCjz5Etk4uFOvDcDh1HnWzC4E+YtMWi3H4Wx47DWfnY91
         fMr8iRCUswu1a/ta9yDu7XdXLkj21t4bSRpgIrZbPjcuIXvcaVZMdrhh0TLdem/sMXXW
         jlW4dGvWN75hnIHV1xBTJEu049kEoeESTvOGqWlcl6oqUHasFZGQtKrXMUPFY7mttRoJ
         JkKWwlUD+fj7ekk1EwWffjafSRBZc9exEtXH+ItzX5GrHY6mdSEvKkqCUkHq4L8qLSuC
         fbHwoxt+yx4LqyCoiYBKPMi3JpcQ2k+ROAHyj1BOra2YoHLT2N6aPZJXRw/9U8YPkIxQ
         a0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512706; x=1781117506;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv8EJ1diTsBXv/odiyMibLViRdzTqWcOuv6X6cwVhSU=;
        b=Ot8Zj3IO/BNw5OWB2UHRrHdfbVZ5CIfvwDsogmqki7lDu1JDhTz/ME3KZnI74NuH9g
         ao/c0AC20UKvfgc0HhYODYsuLwA9jiVoJCJc4p03HcDqIkpDXoM1tRMV/ZswHfMjxqhu
         eqSpevTx1ieYnll6MRJwpcC024l2R3PZabfHssyvRDyR7xy2URsmnc7CWPw3iEF0VEw+
         +eeWZ/oEKofzWZg5+NjDuKNm3dvbooKA7AMGOH2sYBrRQ/EyzVcSLnpIJe+bkVaejkU1
         iP0F3q76i6Ca4A7YuKs40lmxLBB8iNslXkbv13JSvFeSd0ZPcyPx2FeSq9ly9+14LDrO
         ZUxg==
X-Forwarded-Encrypted: i=1; AFNElJ8JDjrQnqTlNDdL9xO4Q5pu/rHo8yVzNfyOYNg4UzkNDHnYJwQLOnnWQp13X7lqFGTAPv5GZ9sReDPR6ujv@vger.kernel.org
X-Gm-Message-State: AOJu0YwyHcxdygl4YZ386r65ttmww/17064iR/BaJXsMryL3TP45cJ0o
	ARmlCfgrI2XCrv2gAZYNvjqVLY1epChGO6lz2mWVQFyeotb5WW0LsqNaDDU+PM2lYCFsIqcNlLF
	b+vGbNlVN89guH+Bg8koOxaRfGbTXqOj1hvgj7GcfknQyJ3/MUFNHmnGYSiuHtjdhAFeK
X-Gm-Gg: Acq92OFu5w/w2TpWQjGhGV/SMr0dkr9DLcq9+8ed6iP7B+QV67rn/0yq1aMa9CK+9/N
	0TPyRacCXG53gT8ayQOvW0EYTanui14ykNtpTh3VAQTICG33x1OibPqpuc4yhkijwsl3q4hNHLX
	UCYgYkYRJh7Rt3pijqDAZpEiXIjcQgPpL8AljX4KtxXLevdt5KNEEebd2yXav6DSXDBLBC2ui2J
	+9jN/51Ln4Q4GL0up9kB1abjbCH0Tlvg3PU0FC2C1NhYGNgdS4DJnQBdHNg4YLbxmLEfGi858tN
	pJUk9IzKFLoqrtNRd1ejeAvhENxlf6Sm6gp1vd8yVSE7z9/uQUi3aUJccvKlXMyvXaXz/ZnJcRR
	RdwXkZN6Jj4UOfZ56D5URckj1QGJrdQJW4BzYHK3LThq1vm75fN0Z6bZlyYbxFrGX1T2K
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701725a91.16.1780512706179;
        Wed, 03 Jun 2026 11:51:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36e32288dc4mr4701693a91.16.1780512705590;
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6d169abdsm2001534a91.0.2026.06.03.11.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 11:51:45 -0700 (PDT)
Message-ID: <81680397-3bbd-4f66-9166-546c8fe753fc@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 00:21:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
 <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pN7QZsN_mUw1RlIjMN4wiTf9zwsy1dTu
X-Proofpoint-GUID: pN7QZsN_mUw1RlIjMN4wiTf9zwsy1dTu
X-Authority-Analysis: v=2.4 cv=KoF9H2WN c=1 sm=1 tr=0 ts=6a2077c3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=eYGGw6GSBUcLogt407YXxQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=7l-9YH0O8PdptT7AxrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE4MyBTYWx0ZWRfX9GrsSw9aDpis
 FQAVA91EJb0khtaM10XLQWQmEDUc+fIAm7HV5zSqsK9GA1H+oN2nnlwhMzPhjjV4ZrO44Byus0k
 VKXYzIgMDYr32hZNslU72nUeec+sF9T0Et1wBjISREVsLpUyoHRdz9vRmmMnzy35p0UC4sxiPwp
 BdG9W+zYuep3sY1yf+TNGKTn2kGPokStx17A1wK38Gsw8KfFGj8zAcAJ3th+AKhMr42uBhUH7dx
 eTqv/TYFgukOEEPCMBVx9UedYjPuW6xaITNjZ50/83hP5WsAgVWNN1IP7f3A4qq9+K0i+ed2xD8
 8bzgetznL3YPwDadZ/lLvJG7LOILNwmYFZZnEgWz5HJ/UKCKQwflLzkPtwXQ+dY4ye/IS6yazif
 zNcYN/n5aUbxdt+LUJGiBZvR+Wtk6k6Zut5TVQtoGqQtZ2WERXpLqxF6eago8MLFAAaLwZyN75B
 XG/ldAw8Oze67wT9wGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-111043-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:brgl@kernel.org,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:srini@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,oss.qualcomm.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C565A63AAAA



On 25-05-2026 15:04, Shivendra Pratap wrote:
> 
> 
> On 22-05-2026 14:38, Bartosz Golaszewski wrote:
>> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>>
>>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>>
>>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>>
>>>>>>
>>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>>> mind is something like a new field in mfd_cell:
>>>>>>
>>>>>>      const char *cell_node_name;
>>>>>>
>>>>>> Which - if set - would tell MFD to look up an fwnode that's a 
>>>>>> child of
>>>>>> the parent device's node by name - as it may not have a compatible.
>>>>>
>>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>>
>>>>
>>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>>> have the child device reach into the parent, look up the fwnode and
>>>> then assign it to itself after it's already attached to the driver.
>>>> This should be done at the subsystem level before the device is
>>>> registered.
>>>
>>> Leaf drivers reach back into the parent all the time.
>>>
>>
>> But drivers don't generally assign firmware nodes to devices they are
>> already bound to. This is racy as in probe() the device is already
>> visible to the system. There's no synchronization of device property
>> access - properties are assumed to be read-only for a registered
>> device.
> 
> thanks Bart/Lee. Any pointers to take this from here?

Hi Lee,

To take this patchset forward, it would be helpful to get your views on 
fwnode based addition in mfd-core. Maybe, a member like "*named_fwnode" 
in mfd-core and then a lookup logic, or any alternatives?

thanks,
Shivendra

