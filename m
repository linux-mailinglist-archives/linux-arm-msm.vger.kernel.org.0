Return-Path: <linux-arm-msm+bounces-116883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3s+ELnG8S2qwZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:32:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04571200C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:32:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QPOMgj9g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iaSUEMtC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61CD531F954C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90153370AE9;
	Mon,  6 Jul 2026 13:57:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E92E0B71
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346279; cv=none; b=hLSy0N+Avw0+B2XLexYARPOSq318jcIH184BGuvjFZxlE0P96Zd0L3aEXqrKDxsGnxsJU54CEDeLdRUANoZJ0IJekZVDVDn5URzmCB0CiGmwfLSlnbFdT0w4Dt/3l1eJCWNMWTSrbqBRxY9qBBTVh4Gc/WhUrZlHDxH7BzWjrzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346279; c=relaxed/simple;
	bh=IDjOOfeOZ8wFAqZTFpKACGrLEkbD4S0dBbL444WoFj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSnlxXYbr266qpwwtLhPH41gNAf1lQzJ2TC5pre7nTSHbYCKxUM6kIdNg/Qg2e5Sj7ZtmeUFsLI2VN+JGQtc5/dNpdg++9Rv64rghRCMdsEOTOrTXS5RGoJiYVrX/fy4vKB5IIM0SdoXatAcAJNA9UpkA31DYAdS6FHykrB55yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPOMgj9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaSUEMtC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTqE387522
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YPJxXsZP3N6RjeXTKZEWlYvT
	PiA+ZJkZ4eppKfRD6pA=; b=QPOMgj9g8/cUp4qyhWsxsLUmG5qebT+8St3XPUim
	yfIqHX6CQsojIpmhSQFaUDZCRBD2akHkt/kB1H05Ut2JUPS6bZ5tDQyCVLHvvp/D
	/wPj0qAPafADoHjnYQh29scU+uaMYtrvnDOEfV4C9GGZOv+0zyRoIeTdTCzhWOjw
	D8C6P6ssNIVggStX7orX/S0vODq6XmWFPucJiEnR9Vnr1ucjJPeMA6AuQaFtKQxg
	JZlo7KfAXTuuXvKBB2MauJ7R+oiZb1cGAjJlXcoj6Gqgj/npPMnjONp7fFOGVFwO
	ePXgG0TCIONBkXbo/bUDwhbZgpwp88+xhqj6rAp0CGApow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0xq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:57:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89956023dbso3878196a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346276; x=1783951076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPJxXsZP3N6RjeXTKZEWlYvTPiA+ZJkZ4eppKfRD6pA=;
        b=iaSUEMtC+DyXiGrrbf2eJovSN0mh4VsXzsVgfttAOtHx0OPN0J7ZBHx81m1raoBSCV
         0jOMV7sVa/j8N/4b6UeeVFxfkiGvI0atl9sbuugUhGOkLG7aT9JBWcM+gJPo1MBlEK2h
         Ru9OwBrXxPcn+6RVdmzfB7WLvGlnJkq4muwavuRX7WxFIL9jEI2cyXDLTMA34fE4Pw4s
         Bm2ZjrvyP0W/TiGrEYy/o/LdW/zM4vzonQ6WN0sKhsrSqGYPKEzNSolqGbg52FadtwKT
         Us2r99iQ0GpOhLXK1V4FiwSy9hDBmFXa7FntuHLA0uPRMlu8j9HxnUNoVLdV4LgCr4ei
         fmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346276; x=1783951076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPJxXsZP3N6RjeXTKZEWlYvTPiA+ZJkZ4eppKfRD6pA=;
        b=X8SwH+qBPUav50gsRWFeWEVQP+wS1fOl0N6wgorSz09IkLA3xrBt+az7gVCrJpj0kf
         6lyymXLvPNX0m3NMHXuRpGWz2/Iv9S3xFJ/+e5ji9+c90CGcBGDTBZ8mbTEFZ2NmMMpC
         s1+gXC8+dFD1dAx1PhiBSHacpAsD+QxXTA0mfksQJX9jsrzZsAqxZg31roa5CF5l8vD5
         brY6jtBctlZ6NMtP9Sw0vRT3Iq1jQmB233syk/dlMb6tVd4EFr2AfMN07pb+jEaeJuxz
         5gmNpt/5kZbJuQ8JQzeq0AUd0L6Wkg/8MS8Vcq1kKDsK7vZO8Qf9rYwNq2/AnnNM3ZTQ
         vc2A==
X-Forwarded-Encrypted: i=1; AHgh+RrHEV1wsWLbMmCR03eJ3iFhN+gjzyQqQdoWZW78VvA2gbsgnJeDcdAY4WDJixOWbkOYyVp+c8w20Nl5KJC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwaaT6A8FO+m2kZgDzsbxcPokvmKDCgwYgGSxJ6gc90T4wF9nq4
	3BrMGtnkx3DXVYWFTNoxmmObWePJPzoD/4B5k/wcw9/Uph2g085p82Dv6J3rMcVTdlGOoquFlDm
	dZ44mvn1t3X4ii7ZzGvsqzNveQ78/2ikfZT07A58rmR1WfFkI7XQHFdjMq8wIMx5PxjTP
X-Gm-Gg: AfdE7cmI8oQFlai2DR1JssMXhxgBJktO7dbAXp2QISljJOvXR39pQXbTwlPrc79i+N7
	yTA+1wThoaJf1uwL/Fv8LdupjML4GTJXE0E4V6ZezVUOg3JIEgXakPygqO7Zhlq5qtblOXQay/t
	yFeT3crCyz9zhNjiNNxlSONRh6ZjBLIexY67zxD+awj53s+G3QXE1HMf8JVfsGWkd9Ol0+Fcw0K
	hu6AKejXqd7dQxk8LWr3GgdtaOI5FVE5cigG+P073r2usd3yOoudxPFPiyTuZmTPnrwsZOUDfJt
	FLnALnbu5FfjAKBRwkVoKkeCJU6y6nNT3ezZ4ZNKUe6Zua7RAlMJbcAswwWollk6+sDUDOI6Nl1
	JUvVhz1Bww3BFhI0R7a4glV+203Jy78SncExasWmvJGHu
X-Received: by 2002:a17:90b:3890:b0:381:41e9:32a4 with SMTP id 98e67ed59e1d1-38756030381mr612587a91.13.1783346276179;
        Mon, 06 Jul 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:381:41e9:32a4 with SMTP id 98e67ed59e1d1-38756030381mr612551a91.13.1783346275709;
        Mon, 06 Jul 2026 06:57:55 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm36304130eec.4.2026.07.06.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:57:55 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:27:48 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX/s4Zq230hJ5Q
 IUyZH368PWyobW3iEMTodfODZE76zV8e+bs3Ze1xzDvBNB2tLyYX0b/fYsrnMVuiD84xXdzgmGS
 hasZ7EFHt9fHRYl4X9WjjBWOhZO+OnK0Kjo10T2JP/TJAPIuSZKhF/v9QolV+OufwPssIXwdMTf
 Nlj6FNE3Z44spllkG0nzextqKaIBohr3QnKfWGiwKRWneCmKAub01/WQojXrQ3TdYDxMvwi5W+i
 KXTnc8BBRjllEu9IpVlOuJGKaXZ8CG/t/v9WA9SzZ74gZijSsCmBRge34yj9j6KtQuiR6msoSC8
 IYy04mBqXdJ4qmJmAOLIRWRojWWi2mcOCdfx4bwCuTv7UbdhuOAhG23YPU69naqRLNgVDpsxJZt
 bkrJAFKrhF+wS8NxNkhAU/Dh7KHx+lY/7JAunjG0G9ltFx/jUA4xj9A0Nz8qnstyxRm9Ut6QWM3
 vnBBU9YUL1plLa/+aYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfXyjlCI0gXaV3K
 uxMFLLGI0TLyFOHbcwHRqTCoZK2bG2WZTIo5eAJfGwVLOHbb4i7FvH1cijCKcz7LWgY4qGvQOud
 vKEx+LKLqOshnJeCX5UjGk0jptvysZg=
X-Proofpoint-GUID: 7KtWJWGjrpHzlzX0iTgpmdL4Iaog5pN4
X-Proofpoint-ORIG-GUID: 7KtWJWGjrpHzlzX0iTgpmdL4Iaog5pN4
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb465 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DDZHeiFfpNG52dTxXqoA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116883-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E04571200C

On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> new file mode 100644
> index 000000000000..0c7ffe9e415c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> @@ -0,0 +1,1918 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&firmware {
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";

I believe this interrupt source is GearVM firmware via Gunyah's
doorbell, correct? How do we know that scmi0 instance's interrupt 
is GIC_SPI#963? Are these assumed to be constant/fixed through out
the life time of this SoC?

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi0_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +

