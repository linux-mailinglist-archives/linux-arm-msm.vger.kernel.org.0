Return-Path: <linux-arm-msm+bounces-116900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BSpdKtnFS2ocaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A347126A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RtyUQ98j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ONcllna2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 792B23019FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BF237B011;
	Mon,  6 Jul 2026 14:33:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416837AA6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:33:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348418; cv=none; b=VF1vOxyuNCIqOmOyQJGioSj0NaX0rBc5g2RNOoiBNI6kxS4ocNSRl4g6VShrZ2yRhJoUJcgmhvfuKKDNwAiZm2FUMh/yJCN0dbUQHyDwpiR9IfJHU2GrWZj0v79cgnZXOFqY/WCjtLNCW3q3SGqPs4jbczfUDQqzxHehjYvOA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348418; c=relaxed/simple;
	bh=Zv19/+GZ6cOuxDrtBFdPj15RwKwBFX9aaiyloecDSXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Wlt0LNQ4SJf0vbFRm2i2hzOmCOzwI0Iw3obP5LO966vOPmP5wTxLQS5ruvsarXEuH82+62YqsABXdv8agFTOk+UCTadfDkq7JaTznpnMlMe87OQMzyAkDRTH51Cpp6CedrxZ2SLntMpw1mo4PT5x0im7NI/WJCImA1rRpmPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtyUQ98j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONcllna2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEHFF803544
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zyQtYGJ8z5oEr6iVTxJjS8i
	/YH8lsktPhQpqrHWPME=; b=RtyUQ98j9IpUKUc602VLeGGpME6N8e++WX5Sk30Y
	TEjQqCaSAMJefSnvSzoIgbtSqPFcVBD8CPO2aaqBCh5gjeAd4V4hmMZyvlAw6YAy
	NF7vEMfySEWcf1+B6IX/+6lOBT+MqtHH58xIs/dsFYewozMsWij+409wKyDB1lVg
	jIOYhsJVETDIFq9CGTmaS1cgQADykmrRGeWe+fddvQXA9rT4KH3q5FEN3JDjiCvm
	uiAqjPs09RaSesvrjq0frXKlm+xfXLhwDRKOW+h6BxrWUngCVK0mhHTWRg3d0xyg
	ivJF4be0WwZ9Bkor0Fvh3BbKNlxobGsu1zFOgOKfRg9ImA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51mp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:33:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so321972485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348415; x=1783953215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=ONcllna2CAD7IZ7g3PnjjqSUqX6zaNScLmhTr43Nx0lLWOPp4lliQlHwcr5vUI/gjB
         d5XlfzPJ1aXMFZRZHZ+UY1kMFvOebbl7ZYGlQPwdMbor+s3a7u2NL4OIjmQSK8nQSUwH
         NZ7QID+rmQGDRwRrBJw1Pem7nJ2Nfpqq+idhovGlibo4R9Em/Fwafemk3z/uxTBm/78c
         +53rdbrkCinNxITpSiru9EU0gtebaCx/k17WNdexT+M/oYJ+xUi7Zighcr1243zbPEUy
         WNoJQ3IdzEHv/4hIYAA1GG4Mo7QAC1p2a3NG+NhzGD64mnizRhzB93sOCPhWdZ+kqXMb
         Ji3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348415; x=1783953215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zyQtYGJ8z5oEr6iVTxJjS8i/YH8lsktPhQpqrHWPME=;
        b=azd++8u3BjZvv9Xavf64zWDZjuc2/dWiRMJZ+wvlj3mNCJFe1BIjmzi6TdxHs4ZV4J
         tpFaVqGFr3MNs15oOMGZzgysXzfnvQcllQT1NKnR3LdABgBhK7GK5N9rXbKor5MenZ8x
         IGi0lD47YsRmyNQW5Hw+AqR4nx0PqE2HxmNmNbgxe4IAucXJ9yw/As7HTN07ux7g9D8k
         SkiR4af+11cQ9K64GINDaMoUliKI9MUQKpWWJoz2rfH+cd6zMTVceSBkNEadGgF39Zm0
         rQB1L0jdRYGF28DdjsoVvATJIVu/i4oBhXKR8u6Dibus4cACb8vtRePgBem7TL/yDAps
         ZD9A==
X-Forwarded-Encrypted: i=1; AHgh+RqQ8/Elmxafg6Oj9EZ6dRC9M6/k5W7JPFO2PQWZI0PKDrkDdEhJWNzCOPC0OFQbIlyz+Qvi6sOTLGsSG6AM@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZbSpnLkXSkrVvbofED0PdbWhREI7XdFzuJkhBQlJJJWRrWTr
	XEfaBZ1Ctpf03L3IguSEtevrjsCFdM9O68jv0u7FdB3E/u5fPu+2jmwnGhCGtYjKPBONtUuC1yF
	mipim6/7mA4NWJ4Svez8ZCjO6S0CFDj+I1z12817wCJI9xc6A/G+4vngmPGs/6iYZGxvBlyh74L
	IH
X-Gm-Gg: AfdE7ckf2SIaS1M614kZlwH4VWjk8F8vjsSlx6y8fpqw1YV/D8Y+8jZgGkbpA85PIDr
	XDTl+/L0+yD8r4A37TDCqBu2D1wSDRUdgN5NWjCJxHvfZ2eFx12JFeqheB5RIxr6n/6yW9Zf26r
	GNIft+ORvHmK0SXyDIe50QoZ7Bi8o/hqrzo/ofz+6coxL8yO64kwyaYVUTxkPV+k0b2OdaarqwJ
	M8aCpdbYTGY7yHMtycApIi0zqpHUPVmZ8snHoF5fgEftUQr4c4HHe5Nx+fMX+DANc/ZuJrbaZoy
	+P+YTkrWw4e7I9DNQM/4S624UyTGQTLBu/u9zo/0B48eWB/2ZaKpusdMe//daHbRIPxYBaMbfr8
	RjXVuMAwPFc7JXB7vV3jooFKC45qJNk5sm0jGeP1RTT6V83C1jwLcyjXC3B/pLN82LZHZXt+frM
	1D9CSzzTaPveKPHLHghte2tSdV
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113682685a.66.1783348415395;
        Mon, 06 Jul 2026 07:33:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:92b:6805:91aa with SMTP id af79cd13be357-92ebb5c875bmr113676785a.66.1783348414849;
        Mon, 06 Jul 2026 07:33:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm2964202e87.84.2026.07.06.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:33:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:33:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Message-ID: <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
 <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
X-Proofpoint-GUID: EGzRh4iMmHBWGaFPbBQUnv1BjmUgk8cm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX/+3tLgi2wkrl
 RHFHpFCNAa/wNXrfK7zR6pFa4p+HrlfM+ECg+jtYKdh62ubGcowCPXujJOSxF9HY1PnrcpZiSsh
 Bp709CP5ANlMiE6LhP8upXoMc6qq3SQ=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bbcc0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=30hatntaN9mTsT5xc2EA:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXwBFjhLaqhIsH
 48WGNywaHg7l4qRMAjcM6AtNSI9Fq/NOQgfG2pWf5tJBeLecl79fZB7X6iCd3ZMl2QmaOIAUHnU
 5etE2zsVM8dLjR3T6hEDQF33pCSJ0AQXyoXTniAOXbMr9cgAJ6SgKGBTe1Wo1dj6dIMFP5jB1EW
 nZreNhTw1H2l6X2HQ6F2BCSjY7v8zFuI5rhxVjaonq/VE0DirCYvulzDkrZui/A33ZvkCnsmgmc
 ODfbDMRtgJNt7hW2nyCTWtliyaYok0+ax4yGAUVyBnxcdrDqoIPKmQLYREjOI5E89uk6aGuBPL7
 X0oR64rSOgr8ZiFaY63yp+eAG7eZ+58FgUxPm1Q/iN152d+vXGJg4zMZB/DuTM/PC4+coAeN8Cp
 mJJiw/s/iPyxvf2JqZPxdTD+PVt7M0q+IDCMvFoQ4Yd6Y0VXVuI1XNtI7CPs+ePt47EhgTHsvy4
 DFxhnsWNNpky4jZKWJA==
X-Proofpoint-ORIG-GUID: EGzRh4iMmHBWGaFPbBQUnv1BjmUgk8cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,igalia.com,vger.kernel.org,postmarketos.org,lists.sr.ht];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sli6for2zmo6:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17A347126A0

On Mon, Jul 06, 2026 at 03:38:42PM +0200, Konrad Dybcio wrote:
> On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
> >>> +&usb_1_dwc3 {
> >>> +	dr_mode = "peripheral";
> >>> +	maximum-speed = "high-speed";
> >>
> >> Does super-speed not work (if you also remove the qcom,select... above)?
> >>
> >> Konrad
> > 
> > I can make a file transfer over scp, but the speed is inconsistent and
> > slower than with high-speed. Must be because this device does not
> > support USB 3.0 (super-speed).
> 
> I'm asking whether it enumerates as super-speed if you make the changes
> I referred to and use a super-speed cable.
> 
> Some devices wouldn't, because not all manufacturers connect the
> necessary TX/RX lines on the Type-C port.

the GSM arena lists those phones as having USB 2.0 only.

-- 
With best wishes
Dmitry

