Return-Path: <linux-arm-msm+bounces-101743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFsoHd5D0Gk45QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 00:49:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB5F398D86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 00:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95756305614A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 22:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D7B351C2A;
	Fri,  3 Apr 2026 22:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMx5Nrhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDsPMCcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C8345CDD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256391; cv=none; b=qTffAcVsWf4pCa9Kl+Tez8S/hrlm8IT/u/rELNM6htlSpw304YzLwhMObQ3tDRT0RAuQUJsYCeOon/abGVCd1VVJ81IvsUXmaswqnJFwjceZo7pj4r2/g/om2zoue5nqtJUn4zXAmIuH/e0asm2Qh5YLhRdQHgVIHPvWEppUoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256391; c=relaxed/simple;
	bh=ZUZX9u7faTLUdSbiTG7COPkxbBLbnN2HOrjOhvY2uH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO7zGYIFrGt4D0mZ26aqHCKzUPArtQL5RuMnqgHsZ5UYb3LX3MJQwKDPwy1+RLWzBTYekxMjyiGmCxCHKd93jwyhZfvOwGBccRijVdy8RH4qE8zgo7DXYex+T4bgxbUBp8vF8WHmhJBileWFunuXPPT3axPmKmP9iyabnU+9PRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMx5Nrhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDsPMCcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Et7a8947872
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 22:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zv9vOkJ9P1gIHigUvKKjrH3M
	x5Ul7I4ediYEdltY4KU=; b=ZMx5Nrhs8cahlUxZ1JG96IFj4/rPBGHhcUxtjRos
	auBcmEVl1kWmOlkm5f/m+EigdLL1hD2CFGoc6N8FsKYDmWj8I57lr9jAZhtEHYjU
	TV8J9Ji98H7+577UmV219YvQmjmH0mnYcUIMtgaKfV3wmxjVKB4QP5ndnfT1BWUv
	ufrq7CsByRdenfHkUz+APlgncHCECjmos9POdNxmHNhT8LuSoLMH5xSKKx60OOfe
	U2oR5TpuDZyA3kBCPHhnRKVV1oc3Ql0+Hx9kvbM3wwxRF+LExUhEIeVPArkFhKFd
	M4p4CGCSqjp1bRx0jxCYfzImhvlAV6tFaCGJwSSC3uTZXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfm43h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 22:46:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso31960351cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775256388; x=1775861188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=JDsPMCcnNkXrE9cfEexlwHrKn7+PFoH+Wwk79yoYCvxBF6QCSf1AZdcBCFBZKDhuS+
         hrv8I5/+DNvttpgDKWiC0KmEMlQPnPktTvoVuqr7GAUUR6erp2DIkx1DwrSUl3BW6ncZ
         nTjSow4bNGErdkNP9bXVPy5KIzlB5deSNSPulAg+g3LAgW9ANyLJtPBFwUEf3r9DOvak
         uEwWbfE/ODQMk+PaEwx/x0wPejp4HHZzyIbX2tOxfT2WnTKXN6yqDvdowAdqfdnmu6bQ
         umQeaCaVsHE81QulfNIgRML6MNw/OCcvENNh9Wi7BZd8Nkzc4IYxfOG8WX0ce0Hx6iZJ
         GkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256388; x=1775861188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=WD0bbA41vDW5VKxOdZ+Ic9yD8CazkP1uoeATLUECTHQZ88xy7hytXHxqUXwupEeNuV
         2VE5Vl/j+E6q53abEAVFUvDeWkH/SpmQqGQUreJlO8zexCg1x6u9jwhsN0Xwvmkip4fX
         4UoHPmFiyuTKy5svZT2hmkuClzCPXTusJ82/YsmAn5L242P61kNJogzvvpWRHcdU9Lw3
         kiXHLCirrbwDmLr1zH4lJLDG48Yw5SEBzho7QOt2Deu42KqWCumYLOXjThbmGh68owG8
         JMPDLaWdxyqE7/hBFxw0J2yOBR17O4i8aAGHH8bpk369XhdDKa/2PBjkwqSXqx8veIHo
         TciA==
X-Forwarded-Encrypted: i=1; AJvYcCWA9if2xBrbGQGhgbqz1wfIEnXpJotMXWLs36gewU8JFYlbVdj7UR+ZISddyVTFa12971DBaElkVK4yPa4V@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBCe/YhpJUoTzPI7M24t1hWks0qRRJhpuS2b28zsvm5f8WK/N
	qHOb9NCeoYncPW8d+tMc5djgmNJmURRnVqJfEUfOTYzpcB/SkTzy3FSnNO/DKmgd8I34/7PS4+t
	oXm2bjXRQkalxa/pf7uaKyWJ4Q5iord4IsIymMoMvKKGETLG2thbaZp5SHPtZdx9FboaQ
X-Gm-Gg: AeBDietclvFnm96CJzRrHyFz/Oc4OLo8Olx5dmo40XEEtGXER+XyVwLBPIU39uzkQLa
	Mx+mkRHQd9jAFyzvv7bLyL+KpwarcXsWWwYR8w09ZsqIfpzRM63DE7YKb4ozwfYGICKEOOUmLgt
	UGofdkDcrmBa6odgKAj/j0hMpFwhCjYsc2NiEYa9TNlRuBnWOUVnAHi+oQaMtk29d7oyfwX8VHj
	Rf8VA35S4EMYI7v2YYDBAEl9Abtb32fwmzQUE6QZEl8O8smE8Ryv9iX1XItwMsXqdKM5DKkSFTh
	6kXKwrYVs2LvVHgRjoW7ZyeMCqqvdrVquBuSzeOpkKQSqLL5Of1rKcv4vpPYIeVPbFmluow4eRO
	Gl5XCElXGlE0BkkFhITM3LwEjS/0sa2hTx2sbDivu98f6TcSuqIJza2yUinUjJE+FtS7rkujBdG
	0/17RgthWQghY/NlQaF3Ve3TmJCfVgn9Q1/BQ=
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220491cf.2.1775256388048;
        Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220311cf.2.1775256387582;
        Fri, 03 Apr 2026 15:46:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm1717811e87.9.2026.04.03.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:46:24 -0700 (PDT)
Date: Sat, 4 Apr 2026 01:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Message-ID: <kg2sflnuslexbch5lycyl3n2ry72lfagqvtjald5qo4j5jeql3@tryqo6th2wzy>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
X-Proofpoint-GUID: veY-lSaXJ_y33wAsLdhP8TmoCJPImiz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIwNCBTYWx0ZWRfX6hVvyTDQ/min
 YMF0SQ64XXAKMiTaDHtdOa8Ho8xk1X3nJPT7wzdw4xJYAhKXPj3xCvIMxh0Owk7TWpYEZRX8FX+
 zLxnnT8lHpgdUp2AGik0S3GtHFmiSMqkwNG4BJqSiGkwcgr48bPgTayVloI8kclTWORtUX5Vy/0
 1FSzSBg7AsI2VWNfAZOMmfWG5koY7FpRLU6BjcdwfnRDFfhvNFIbvNQZHEi/JfEA0csiNfGjm5I
 DJfbuzhXU08egyBA78zhLx7mwWsKcdEdvoS91+kDlp767UmFqvU5QN/vYSH8cr6QIezHPwHpdN8
 JqAsFBIYaBzLlu91ENW+lq8Ibj8XfVFRxmcHAuYdvTAoMVsQDN5qS2hiEbHchg8NsHEXuAQdEYP
 asBJdbDYJ24kGZQQCfSArDOW7sHmQ4N5J48lm8mLOXYjybTfVsicDDtUXsS43SmiEFN3JRXMc5E
 qdkdvG1Sa9rrTsFQ/aw==
X-Proofpoint-ORIG-GUID: veY-lSaXJ_y33wAsLdhP8TmoCJPImiz5
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d04345 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=F3jmmAGWxxlI1FSMdasA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030204
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101743-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDB5F398D86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 12:51:30AM +0530, Vikash Garodia wrote:
> 
> On 3/12/2026 8:44 PM, Dmitry Baryshkov wrote:
> > In order to enable wider testing of the Iris driver on the HFI Gen1
> > platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> > 
> > Note, this has been tested only with the Iris driver. Venus driver fails
> > to boot the Iris core on SM8350 pointing out the UC_REGION error.
> > 
> > Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> > SC8280XP). Please use corresponding firmware, extracted from the Windows
> > / Android data.
> > 
> > On SM8350 with the Iris driver:
> > 
> 
> could you list the failing cases and compare the result with sm8250 ?

Failing on SM8350, but not on SM8250 (note, on SM8350 they also work
with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM 8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)


-- 
With best wishes
Dmitry

