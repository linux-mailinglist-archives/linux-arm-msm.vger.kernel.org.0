Return-Path: <linux-arm-msm+bounces-105160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJISCQ7O8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:23:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1093491D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B1D4300610E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66673BED1E;
	Wed, 29 Apr 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NluoVTzK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwuwyoSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD973BE65F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454601; cv=none; b=tFFIfnfufQy2YHfvS+xLM2NKDTWSSqS8yNlsQMlKAacHdvXgYzTN6g3DoSRQ3a9gFlDWlYgT1Zyqwc02Y1wVKS42nj5DDks+5JwAvjHkdimE01LcG1KgAgWuNh5R3Fowh/G9zeDiuxVp/E7/+xHOH2NoEEO4P3DNN6novyMK2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454601; c=relaxed/simple;
	bh=1NnJQsLpA6+7KCWjI2WzSalvqCYdpk/3gG3EpaXIfEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bat/nmEJieTueKEyO8hVvZJwZhp3YySpU3NaxFAITYZV68RVn88Kby8TzyCrDJN4l11WecwXU1vC8VeG5DDG038RAeM6YxggkOQp/dAdL59LHle+vXE4+1Fr6vjnG2FuGb50JcFuAStazXGBLgNvztrpmqi2ZA2oZMlWbhHVeg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NluoVTzK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwuwyoSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qFMI3067025
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=; b=NluoVTzKDbY/EWNF
	n0UgMKO7HIAW6YgTUMNXzxE+Dd5xMHpkkUWxf9Wq30kCsiM5cSWq+mFFrrPDDBkQ
	l4zmEoY5YxYZbgfvvrT5GVqRl3NRDarMXN4d/UhgZiwEBJlvRpA3ZBDSTRJQCIFv
	+8jcospOPer1998kmM6HDF2iFUdFo5S1ZmMWYN2/oCGKE5q7ibPPw8hhUcI6tnS2
	mtdnJsplXDmZ7IjQBxillmsjHqVVzmNgoF0yFcqa5cMQZ6ndHnbTROD33mvyviox
	g5WDILuC8OUXAOCacqd+VTMlTvWMRCpaZ3DyufvQnPIDFf7AKaftNgZG0nSUvUm8
	4iMalQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx9sy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:23:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56d85c53a3eso1029733e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454598; x=1778059398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=;
        b=HwuwyoSaVMjI6vVmjdWtm7SN1OhOKRfwIR/JvZiIru5KNyHXo5kbe2qCOJu3J1/Ogz
         4HETRSjoaan1V+iRWTpHYAtqeMqEGkveJnLfxWgVtJKZTd2bnVjE9kDhyNV+SEZuBx6I
         wGuSIbe8oTe+C9o/n0L5BvLU7ixgdc7AQ9v+3HOJAYv5IcEfH5oJrSfWTIAUpYY056vj
         3k4VGo4EXcJNTgxhdyXcpLnvA0/THi+QiUK2wYwoEgiqBS0vtSU+WWBv8Cz4k9dayKm8
         pXpDMse+iRAUJdqZCL5L/nXjv47CqA/muXe5g3hdGtC+AN+urmYC5yeKioHoSLIxpEwJ
         WJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454598; x=1778059398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=;
        b=JN57vGgpT22Xonr2uZlXln7nb6KwO/2cp4gqYpfb3SYBpvHvfzPqx+dK5OLuF1rWMc
         R0bz/nNcrhJENhz/JVBkQZ3eq4kzRzcrM7Tgr6F++YaSzY526P824RUiA+4FkgJ3H/Qg
         H+iXiV3z2rfPyOIsm3isaXHIuWTEu4p3AJrdz3TlvaRJCfB8ZHqxybaV961rqM2SvdPe
         cHiIXllX8kkipQdGVRtB5kL/vZMhTIWYMOx5gxX+4fwr66VNLDfBsUEtUXDOLch6ERbl
         zUQ7L9d7gHrq3goE+7nJyj56Llbmq+va4XsVzoakerUhSIL2ejE5iKROhdea1Ckley+P
         p7kQ==
X-Gm-Message-State: AOJu0YzLAfz2EI8XGhe4yoSI1Ef1EWO40z08AZUbqwMPMg2E9vc43DGc
	uk2P63a+B6svOGUV+LqjWzPEETZsgq4Qqe1Pu5PynvF0gM35cE6rSRS+gPbtnRpY5/w4PAMsIVc
	VSdHnGUjnSW89NS8Ugdvpp9lFnR8YFo2Emi3w9rH9QkbfZWMDzzxcfrBmp388tSGAT2+bsP3hJ1
	rp
X-Gm-Gg: AeBDietXZ3I3KfvV3AIY/QcPgWVJBTFm02EMvePYO64NgUgtvc0diY/WvJsKGd+b2gL
	joT7Y1BY7OJIIlXiOf/NGq6FAso7iaAuADmfw22aSG505dgVO34hiDFoTmfLU+j3bBWjV19qujX
	danqrappD3f3t7ClAZ1V9+Fb4Ktnv9T6yoAVC+Ei1bg64bGRnC+IngLfwkyY4MVvf7uF5i92oWp
	f+qy49ItBlnMlrUW+OWvwunX6cl1tNg6gFfiggzOrewiWMLZ+r/dm+YDqa5lglakUIV6SCWCWOn
	IPQL0vcLe4myjpnHMqxMIfsvxlAbbeOgr+E+yz+CzPdf8iecJDGwgE1rR8Xj9c1l/sl9yvkSTYn
	pfdQTnPH2327rVPfsN0doY+biBBKQZaIy7zpn/pY88EYB7q0ME9hFmNgxgE2wn8+MY1P+Krr/sn
	KjXWpDKCv8OcTwcg==
X-Received: by 2002:ac5:c8b7:0:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-573a2942f1dmr1298100e0c.0.1777454598161;
        Wed, 29 Apr 2026 02:23:18 -0700 (PDT)
X-Received: by 2002:ac5:c8b7:0:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-573a2942f1dmr1298090e0c.0.1777454597661;
        Wed, 29 Apr 2026 02:23:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9854393c2sm65350766b.36.2026.04.29.02.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:23:16 -0700 (PDT)
Message-ID: <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4UaOxpc87_f_xb2uSBH1BE0hX0LNRCpF
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1ce06 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=V2NSo1CrvwOFa_RsOSoA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfX9qRh7eEAHJnb
 dzYIkGnUCTKuuTGo5uJrhFOHvWGBiDdjwQu41/XRPi9f+ydIJky33H+ghGYkYdDlaO5w0TbIVJP
 l2QySP7Ldwr2XQkSwEdnFYVHkIhsUhDhgsiR6qvzK6CFBE8m4a+hZqT7CwOJa2WNI+30scSA+I5
 QXJbTvtgD1ZYUIuOdZLapkWQZ6mE092yDbANil0LKL6bqOFTit4SyjRkfCFlUKpOgPpD9DmspIY
 Btfd3kuEPgP/KVpuhfBK5ttmpGSomHMAGcnNt4MukD6bKPMNW4ULcVsI6KNWsbeMvuC1sxb+1Q/
 jH0RM/uXU6ZvQeMZiirCfW37Vhh/pkaFkDDLTgdFKZvvmLyGQesM+l86KtI90wa4C2gLi7BtqrV
 f2m7YQxn2H3d4fQqE0RxY52nDovHEt6WVm4TWJoL+z3Rxst4rnmpPkCtT1l5CH5xI0UI5XdUuXM
 BJgk3STmS+F/oms91kA==
X-Proofpoint-ORIG-GUID: 4UaOxpc87_f_xb2uSBH1BE0hX0LNRCpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290093
X-Rspamd-Queue-Id: B1093491D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105160-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

I'd say let's make them all `default ARCH_QCOM` - all of these drivers
are required to boot (minus the OSM_L3 driver which is "only" highly
desired, so that your CPU's bus isn't heavily bottlenecked)

Konrad

