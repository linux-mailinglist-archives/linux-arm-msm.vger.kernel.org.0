Return-Path: <linux-arm-msm+bounces-64887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0EBB04B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 01:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F10316B3AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D56D283FCF;
	Mon, 14 Jul 2025 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZrwIfyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6E28313F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534050; cv=none; b=sY/15QHHEx0MIgtSZ5vpuA+Q6xrqlAbGOFowLL8/38XYpiWWLlntKZ8aIokD7U+GlQVEvppcO84Ac8u4MjNwj3ulwZukJ/zV95v6HiaH6rt1ocEOlr38AGDd9v1bzPDT1un73pPvcx6sW8ekvEeENN2KE6inM6WJalU+TB6WdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534050; c=relaxed/simple;
	bh=e+0Cmmr4F+K/R2UeN2Bly9ROfgx+WBmlS3RH04i8bz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn5KJJyvFS13IDdiq1ty1rR5cYrq8Ur/vilEuNXYMAWjRjgGWv5hvC3USOyou12f12HBGOf3wBXpg+E6OjUACvtk/b8gtSNJjRnP2IzvRoIsoZvADGJPr33fFKf0YhEjJSpe/99RMDiRJnDStYwEVgo8Xv1727w5PDtWAqckOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZrwIfyp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJeLZK004347
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NpEqFQILBPEuMCnazZYraXh
	kj5p8G0m5fq3n1OtqTk=; b=QZrwIfypgs2cF/bTIEwT02VNVdPwhEdVQsD2FQmR
	m4B6NfTRZhLE75Fx+uIXpbxxo0bCY9dckW9DLuWYVoSq25QtI3fd/U2N3CQZ714c
	udTF/vgm3Xv5yxrjO9ipCs87hdxZTQpybkCpqgcGQKD0eHn5+gOsoV9GpSwNBCO/
	3FFg5W4MmEXo26yQN7zosVztTe8M8Gz+RMJ5h7TZBZPaHELGfsKVMJxZf8o4QF6p
	qOTb/GDVMlLbNnEiF6rYcg7m4Y8Tz6fiWbBPIPvpMJZYz6Uw5GjphmCuz8fflTVv
	Zcm9UXd8n4FeGiUunpLT8kE6o1q0ma5geqOGhbUaaY4sBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxax5p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:00:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e1b7fe85b1so341528185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 16:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534046; x=1753138846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NpEqFQILBPEuMCnazZYraXhkj5p8G0m5fq3n1OtqTk=;
        b=VKK6UdYbDlITvfrskzhp/6sghwjhn9LqwvM2QJIKS9YdjMGvS2ArMTv8fbkgJXlYsg
         cpAVkI8lcFxCsy1FErum4M6qVI7ttcD/OWS9wQskwuZDMt7qqhzWDo0HdhIPutknjOWc
         LmlCz4y4FC7calmlqJQZRQC7axhH2nzJtXhyGc+83oxHgTsX7lfIl6FckJ0YgX6KFyRY
         S53Mwso355Lb0yM04FXX1py5R4/bMjlhvDFg8LMBwJdImMhD0dO/tqC7j48pT8Z7Xz3w
         sELU+fHcOxI6st3oOvJpaTWCZXtU02b2I7RTCMnEvluZlLnPpXEnAq0u7SLElyFxtg43
         Uqpw==
X-Forwarded-Encrypted: i=1; AJvYcCUB41SYQl0CJAwvcMuAJ3D8r2Am2W8dm1HR3kBJLi8xanZGtiIxWRoIOuEGL/HfM1ZtTKDtCEd6NkIzqV0r@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQSqtCnS1eocUDSCfXFzPk5MGDV9Ji/8r1eNqIRcTYeDoyPo9
	qXHClosAPplFj4sbf6DrPMqPqOzjzTUpgz7raO8ESFheIOhqOlNw+GKqPdXRcSizr22r2BOlNAk
	oNdEX4+ZgCVogWsuHLsVfNLTJck05imCXzdWX8+VPR/4j/pU8Ewny7d9F4QBGvcdJwlZsZuTXw3
	nP
X-Gm-Gg: ASbGncvQzanRc7woMyox3ch7spFSj46Ovqowvb2wlyo1749JswyyCStgRsjSFw2VnWh
	r3EhI+fwtGE1yCzn+nmCGeeDm3y/MeDENyYoefepOUjP6pptUP8fJpujV8rxiL3/HoYOMFFRqOc
	vVkJ2gfteg0WKpu3++qrh+4Ou2CJinO6suOzpgvaeuljrabnGKJ+wOHf0n91EvMi29LtM8GPMBu
	F952xZmQoo5PzYSezHt2f/9ZWKb7bWDtoB3lQH+cm+1KXX3XYfYoQ1CXqC2Dp1NfbqslBrY6LgQ
	U7sx7YahasmlawCxm5RbgSJpWbTIl6DbF9wNSjEGvfKdqZgsJdwWrDdn64/gFMibDzkGSuihOC1
	fg8K0lpt6l59km5uORBei53xPm+mRmxR2ZptyLs44RboUjQTDcreI
X-Received: by 2002:a05:620a:6545:b0:7e1:f37b:4573 with SMTP id af79cd13be357-7e1f37b49damr780724685a.26.1752534046518;
        Mon, 14 Jul 2025 16:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTrO7EpByqKu8tXqsr6N3T4ZtPO2ul3BlN+85hAiFoRktXmd5xVQeQVO/Gb1MOMi6eUoHs0Q==
X-Received: by 2002:a05:620a:6545:b0:7e1:f37b:4573 with SMTP id af79cd13be357-7e1f37b49damr780720485a.26.1752534046086;
        Mon, 14 Jul 2025 16:00:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b79b6esm2082956e87.230.2025.07.14.16.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:00:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:00:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <wmbw55r32ep4feu75mlv4mufdnko6s4t257dus2asi2knae5zg@gkxku4sm56rw>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
 <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
 <aGuXcWpYWWGb8w8i@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuXcWpYWWGb8w8i@trex>
X-Proofpoint-GUID: YfPMAmYbqvMOwj7wwo2J2BQ-rmutjXxq
X-Proofpoint-ORIG-GUID: YfPMAmYbqvMOwj7wwo2J2BQ-rmutjXxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MSBTYWx0ZWRfX6Eb3WSQZv78L
 34OlEHE+ElZ6GWiqydQIKr3JVO3JLqL+39vvesE59powG1SXJil5VAnfuyKxA5RZ4knq2/I8Pnh
 2ceWvPzu1nHvcV4m0cPcNjKn0zYveFDxh6W6XG1i9+evdckloancSBYYhHt5YsjhhhXNSc3xdMG
 +A6LKzKiimOCdHNcPa+LAyUDubiNqMoT539jZo+7Kz+B8o1H437m9wawTZVrWaXrzU+EHd8lNqy
 uE3d8gzqbOooWQbEDp+3jhaim29abDxaXxilxz7AS6AyLYfbTZchxR4EtC4tpbMhmkV+RoWMhtv
 /oMXP40CXIVjk9LcwLg5xQ0IcCAlkMd/YO05ssv9D9//gj3OKaEgXDCfnuYSqHIh6YRjDG/AnCv
 qLcYWRQlLCD6+cg/w9jdXxcIsG3YSPA7x0IGRTrydJSNooEKzGdjyNL+eVMj1vYfIjs/GzxR
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68758c1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QGR8u22Tjq3xk0LboB4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=825
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140161

On Mon, Jul 07, 2025 at 11:46:25AM +0200, Jorge Ramirez wrote:
> On 07/07/25 10:29:56, Bryan O'Donoghue wrote:
> > On 07/07/2025 10:26, Jorge Ramirez wrote:
> > > > > > +    maxItems: 5
> > > > > 2 should be good to support non secure usecases. 5 not needed.
> > > > ok
> > > isnt it better to just leave 5 here - thinking of the future support for
> > > secure buffers - and just update the dts?
> > 
> > It should describe the real capabilities of the hardware, not the expected
> > use-cases.
> >
> 
> then five.

Just list all IOMMUs, if we know how to handle them properly.

> 
> > ---
> > bod

-- 
With best wishes
Dmitry

