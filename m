Return-Path: <linux-arm-msm+bounces-96890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAO5Cf0QsWmYqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:51:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87425D0DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BBE93062403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042EC31690E;
	Wed, 11 Mar 2026 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIiekHoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ6vG4TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DAD30171C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211816; cv=none; b=LHCMdRnPgkAmSAADB3dEHQJKJe2SbtTb2P9U4zUyM2Hcth1FfkxWpBh4oSKX7hEZx2sVl8vm/XD448kY0QABZ0E5OMMNShpkLXjjQt8zvFu4GKjbIVuRcK4VM2N9VgwLwNIxYNhgh+6i7hORarIz2unTekhu96alPAjPu5rO+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211816; c=relaxed/simple;
	bh=LDI5IRfqOf9kJrBtPimUf7w87PMx4XjVNILUEYeSwO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN9I8m+2RsSG9ir/Tt+PAYM9F3wPWGYdzdftH02eM2wyo5DPhs/NhEjI9Gapsubeh42mbVoyu2ne/Ut8xWVxk7/DbkC4z2fQbkZqOOI3shYE/4QvC3nHE2w5muqS2shLjUK0lNRzDW7cuEbadzpQFJty2lEpijiBBBavOnU+TAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIiekHoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ6vG4TF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6hAgm2676579
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jM+2RSWSrX9q7YEjv5odBisi
	s0iO1XVRbBwhJmNg4sk=; b=lIiekHoSZAK2khYRVOSkm5ksmCZalEz+s7C2xTTh
	CkOoBL9tJtPf1GuPN3ckyCjp0XO83ZWBmwesvaxzl94DEh04ArZooxEiNh9sJYDn
	6S8Pukl2EhOlEndQse4UsJE8NS+RQ88xGSEoygiT8b9SFLObwgK7U4IgUaq6v0t/
	5kY4Pjz4v00p9YE82u7OT/jXJ1y2m0ien64P/Iigh1fhZY98fCp0g3P5SQcEqZxa
	ZhjHqU730ThSrHLA/LxCBctX7fXbHxI7jCFoI8L1b4SXyZyxBeN8hLAZuMYGJM1P
	MhR/mtuefYv+GLSYkhaBDF0GZlAV8GkGWH7NIHSIa1R7PQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd00sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:50:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4af66f40so109707595ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773211814; x=1773816614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jM+2RSWSrX9q7YEjv5odBisis0iO1XVRbBwhJmNg4sk=;
        b=iQ6vG4TFn/vazkRK/yESRC2YRQCh+CTMf24iZfF3eIwzpsz1256guvehFcISoVwNLA
         dddloimgqn25VD36kv5P4os46qzG8BwaaBC0TZEtmxmqFnywX/UZ2Jym19XSlyKioRN8
         ygGU/yjn1gfJGHmmVRAoreB+EH745OEgBQ5bjoQBriO7/8AMbCNSbCtqVu0EewisnIEP
         TIVT0EjbZfbE8RCydFPJ+MS1Z93nBwGFlggK4/n9+9biookFcyMm5zna5fzcm9Gfs8ja
         eMFAKkMY9wnXsrbNjBlJJTDxSWpn7nLLU6vaK0oT1Whul+BZ7x2xrqhlvUkj7SY7N7S1
         LWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211814; x=1773816614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM+2RSWSrX9q7YEjv5odBisis0iO1XVRbBwhJmNg4sk=;
        b=bhBEfF7ShoX/yN6oNr54qJrhjq6lQRI0CbcS9l8dFAlWYFf4LzLyRZjX4/C5gmoWQS
         ZgMnoNQwPQuAmkXzDnPOR4xI+TCT4tajm97XNajWu/wfrnBr57ZVT374I2JMgVfCtLtK
         QbdDSKjSjp9J4X5Ote+LZqn59YVxsvBizKnMa/BFd9jjVzpMSGvAmIaNEXnx4Wzb5bnf
         9xf3Mk73045ZyVDPDuVjwqKsdPWJer0GYKEpvOP9jCwPapTuGSCuqDXSIP52lDWiodVQ
         Y8YrEBh6/CqUoEa0Sm4lwyqaZMUMwa/fq4aT7Hzu+fCLQQK785P4Wq6QM5PNMwBg1W0A
         t0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXX02ESgpTmThlaKLeLKCHgKCWNj4bw8Kj59HdgPI7QC+6weaXRqkm78CIY3fJWoK8+cfLadiNUxYHQHGNX@vger.kernel.org
X-Gm-Message-State: AOJu0YyjdV3lyRBv5xiM245RLwTQWZiONda2X2XsTPZ3+mVlwxSGYcth
	S82W3xQyzjbbn4d6lajZmUu6mZDqDg1sx1e563gPtmBy1+CZdJICZd0PbuFMgPHD0TacIDBHLrD
	kS6wum1uW+TT/HepnXHGA230QeRDHLpSUp9I3TA4kl+fFP2Ll7x1sCVapSsiD8ItAMuCm
X-Gm-Gg: ATEYQzxm1aqHGN83tSN8ZRqqWBb5KYwlT3ZxVz9z+8fZDDQbdQhBdtb9lJxdv/Pwe0A
	wCeIb88ahVMV+Om/MrCSL3kYHRZtvlJkM5ZZDEOB/PWT1jo8xMFReovfHedGwyz9ZolcsoLVI+X
	BBmQ9fgN+jh8ZoaewNIt/xxuuhLDX23SqJMwsRVYIH/Qn0G0fqI/VA1OENrbh62eTtOWtHfYRaj
	IXNhwbGeTr4H7mTnXY2IqybEoePrYF8mpjpa7If0BWPzHnAGThsWJB77jUUsVMW6kfzJJtIr4mH
	G0z7LIfiDLA50AxVtcB1qN3+Vg/zyRBWzOXqbplqO1LIxvxlyUjPan7p8XM/aGWcPtkjhbTWFAu
	b57EpnBDozcvIl4hAHuqzmUPrCO3LVBuuWz7wyKIYK87qFg2u
X-Received: by 2002:a17:903:2ace:b0:2ae:4f6a:d2e6 with SMTP id d9443c01a7336-2aeae7d3e09mr15176765ad.20.1773211813716;
        Tue, 10 Mar 2026 23:50:13 -0700 (PDT)
X-Received: by 2002:a17:903:2ace:b0:2ae:4f6a:d2e6 with SMTP id d9443c01a7336-2aeae7d3e09mr15176495ad.20.1773211813084;
        Tue, 10 Mar 2026 23:50:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e2fsm16505615ad.2.2026.03.10.23.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:50:12 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:20:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v8 1/2] firmware: qcom: scm: Register gunyah
 watchdog device
Message-ID: <20260311065005.wklyszysmikqzv2z@hu-mojha-hyd.qualcomm.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
 <20260311-gunyah_watchdog-v8-1-4c1c0689de22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-gunyah_watchdog-v8-1-4c1c0689de22@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1NSBTYWx0ZWRfXwN/dqWpOA7LH
 TD22APUs5ICU59GEw9niUhao6XSZsxd8ZU1RcXwyVfDBwRoOx3hGqxcra0JOba8+7rgReZmKR7E
 sOLL+RkEXFfl65H1kdXOcpqYw4PBA3RScFnCH4y9cAAmEyuRt0bg2DS0So9QQOjLqFBkfrtCkZP
 Dc3OP44g2gNGgLJk+4iwOBFL1gEHrCaKDTnBDblUrBgkjT4vdaG9QsarsJFfw/kMouUcfCkN2el
 ikAYtNPiy8Iy3CmNbhTYyFJxyY8A+W30kTwm1fy0sKJ1dpbaIZ73PwzvSv9vGF1wwNrpjAN14XA
 3vhiFNEOlo3cR96jpOBGEtFTvW9X3jJzlXkRdufmBVMXh/yVQWH8745D8QsMWOxvvnic9HI50Ql
 MODrNggwlgbjjBMKQ7UoKRWQ0NcnkPmG97IxD5XopEmdn+0VYxNlztz2Bo1PLuneLHqw2mDcUa1
 ZEQlkeBVDczL5pnD26w==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b110a6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9y8fv63QlTsTVFCdDt0A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q4Nq6LRRJ93FGxA6i8KcXR3DRFOcXRWD
X-Proofpoint-ORIG-GUID: Q4Nq6LRRJ93FGxA6i8KcXR3DRFOcXRWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110055
X-Rspamd-Queue-Id: DC87425D0DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 11:16:30AM +0530, Pavankumar Kondeti wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict Gunyah watchdog initialization to Qualcomm platforms running
> under the Gunyah Hypervisor, register the watchdog device in the QCOM
> SCM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. First, we make sure we're running under the Gunyah
> Hypervisor. Then we move to check if any of the above mentioned
> watchdog device nodes are present, if not then we proceed to register
> the SMC-based Gunyah watchdog device.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

