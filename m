Return-Path: <linux-arm-msm+bounces-111478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MrPuLncDJGp71gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9564D2F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CxY+WRml;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gkx7iYpX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111478-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111478-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BECBF302795B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3704C38758E;
	Sat,  6 Jun 2026 11:24:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506038757A
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:24:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745076; cv=none; b=f1ThWZxpbTu5bn/SZWspB4gq4gRMPMLjO+I+qH+lk+anxGbKD1V8IwLMwCbT34biyaqv6Cl45/El/33ZZkg+C/ztC1f/EF/CVzVQc6jqIctdhei2vNxqhN3ESjDSxFtc1KpMvRhb3MwGYrgevItmDYMglB47HlGeLf+A/DYx1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745076; c=relaxed/simple;
	bh=l/ExgmgclWBFpJpRtUY/BQJUySzP6ZKB9S56fIbouWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goMhaj57+V3WyRzxbEaV0Xl6TJYHvDh8gJUragzFGs45OBuMqQhTsUdZUwQR7Td3YF/43B4i/U4UgyOSu2iws4vW6v57Zy0t+zNlPcGuomCzqqqFPFoN0na8yT2Ap8QhqXMLGuOATJ8OpVTX2Ri4Gtzl792AyL+ms7eAwS41Ikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxY+WRml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkx7iYpX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGcRD1291032
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEmK5a2M9tFkK/HoVIYSexS1
	NneCE018ctH6AmCU/GY=; b=CxY+WRmlcatOuDqsP/X63c0rYu0nF6mkVZZZYv/i
	OL16Nyv6NaqOPkWnCjA4i/yYCchKcqs/5Y71a7a7S4DEhLTQzGBVkwFkO9pypiZY
	KpSsMo6GKJN4nSijNRbJ0FRhPPuZlepKtcY/esjci4ETzTKrZKcF7MWSdrda1Txo
	fT2RR4e6ep3in5w54mdNJLqDKijMD1J6x+G6K/lIhZ/vrgw9AlJqXJR/pnhOMCJf
	iSshbAr5KhCBTFLq5eRzflli+sjyp8Pry+3STIPi0G/iEZfaTca0HQqrUB5PquHi
	AW3PFHxQjKQhRlz4TK+NyIRGBSp4c7i0xAbhaxBefm05Gw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmr8xnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:24:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177f07ea82so67690531cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745071; x=1781349871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEmK5a2M9tFkK/HoVIYSexS1NneCE018ctH6AmCU/GY=;
        b=gkx7iYpXOndueAkbTAHHe66ScIeOoteFLs9yxQ8j78Ak8Geeg3bumAmIiWkbFBtMHw
         OUwG2kHM8mBaQky511Nbkg6JWclxjF/JRg/KqOnvpxWD+TNRbaiHH2eLR9ghMuzTnzAq
         YShK+QbAmhC06h8ZHmcNDT5dKLSkk2kXlOmfenQJdpOHjzLgbaKHxC7QYAy7LUnEs/84
         WVuX/9O3RdKdJsYNUsxzHCMODIxSv78N+QSEySn4MJxTeJgGeJgApi9EvRiDbpOI7iXE
         VCkXVbDuWvjrnN2Lon9VcKzaqCAGXvRbJGqwVnb8UvUm0xdIiQhsYVur+0aOozmCSMbk
         RmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745071; x=1781349871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEmK5a2M9tFkK/HoVIYSexS1NneCE018ctH6AmCU/GY=;
        b=bn2Gy1HHNQ0p4C74H0Nlj/221hlbmIGYYjhl2dV2oOSudKPqE7euGCG3oUkh4DBQYs
         H9LZVwB5r5VdkXdkbOUso8Xc8VfHtE+gKvW2oHPCpNntYqIdtsc9+wi0v8TPGl09UOLI
         KuZEkQ6xItTpA6BDjrF8DDId8goPhTBoS81AF7baSBoAQtAlVkrE2LbZuSF+qThHsJ4H
         cP+yIQm/+DOVB/Gc/pVIolLrd29CJ6J4GISyLmusqfVVo2i5rL/Nl1l50mHAjmgGU6iZ
         8gn9PUuKCIg8cMfH8EyHUvArsB4Ujk7/gTE+JNtBd4cGKX9bbUXXTSGyD+geyACdZCJU
         y6fw==
X-Forwarded-Encrypted: i=1; AFNElJ8Obly8RRFeb11HvVGZpWtJaq5KdTQg/aOklcE/R16OMFFMRVFIqdZH++5bhPjuahOtBtZKv9RF+yXErGsw@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsSiNPZAH4pa3ov38jvTSt6ra/4S58qMQKFfk8uN5kYrY3dYW
	dhyMgBZfB2PVKkR2FJz9Tum7a1noWN2ZtyCmYi7Q54WWP/XHrZqryid0BArMIJLA6zJZ06BzntH
	qcHg/BUiTBgUGeVZtFDYzQv9H41rg2U2sCKYVFBWV1rMv5SXLb1njtyrIGt1Y0C48uiJ7
X-Gm-Gg: Acq92OHWYrBCvM/HCG6FYUfuBVyf4h3Xsisi02EmvqUSJVuZPYTLK7brsUPRfTYVFC2
	kBfS0uRULEq7O8cboo1rNnbKyuMK48Sl/91Rxif7eXls1j2HQ9W9nuWJqcLCDNBzRd2g38+GyM7
	irj5j4rfPOttt865i6fCGIVQ9oYf1D+mig/MjBNHK/KdyZA14+lc0ySWPWDSnKczGNan/1IrUb6
	GGGfkjP++1+kde7mjuv04mFvPG1h/OF5l0nJ1zFluQDd9m2CfQ1EOq2TVGtJgNBHqSdTTW1WKjE
	bchN+iXBXtfkouIjl9r+vCBkaW9vC6Rya9yLYc/1OtooxO5C3u6eQXNAr8GWOOIDsIuNqd/RAEx
	2sDkJK45GZ4EelzlzOD7DixPo5fP19sTTPmCUqsIifpRfwNSshbbZzEGS9Fux4rxMUtv1IkaPF/
	Pa4i49C7hZYEOFr2XYuAk8o7IitXQMN4CW6vZ8mIqZ9rNUHw==
X-Received: by 2002:a05:622a:291:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51795bfe545mr105376251cf.56.1780745070728;
        Sat, 06 Jun 2026 04:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:291:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51795bfe545mr105375931cf.56.1780745070272;
        Sat, 06 Jun 2026 04:24:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm31565461fa.18.2026.06.06.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:24:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfX+DEfOTJG3B0+
 6R6rhJj3f2l+WfFi6pJ1sUcEi7BULRJyO9sdYTClbfuYSEgEMcl4HaPL/l2U9+f7cXPuKaDePUp
 7JiTkNvW+aNKNR0QavfL1RwIYUi8ofTUu4PfEO2Yw66nNfips9pKc2znrDQJF47PV3hMhz4I+Ut
 GTzHGNWYszkqfLtavJVCBLn+mqGmGFsqODTU+53I7jQ1ZdIOo/aLu/BdjWGFKsvLVbz7Gmqk59Y
 02GjNktuF0nVUfS3TQz/J7SO5HTWdsJq8uhokzutX46TmXur62Kf69Azh5AyvmJ+SDaC8uFKEGD
 axaw3mEOc3q1n4kxj2uJtjAMOgg5+5jPCs/nIcFnvfsLc52uDkRAitOfCZzUnL+3KX/0yjIwXgL
 kt8yqysp0rJjqfIVr9fTC9xfsI+Yfe8HhAWB9UyaT6w/u7oRiq25SqLvL0u8RGyvyDwBYdKcJOC
 VSJM+87NIIhhbggKlDw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a24036f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nlFWSUcdM5ibWT9Vx6IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tK9Flj29CJFIyhx2cjX2i2bBBs1o3Hqv
X-Proofpoint-ORIG-GUID: tK9Flj29CJFIyhx2cjX2i2bBBs1o3Hqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111478-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,pqlrh23sljsz:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38F9564D2F5

On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.

You got the feedback, but it got ignored. There is no explanation about
gcc_gpu_iref_clk and several other clocks becoming always on.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
>  1 file changed, 18 insertions(+), 142 deletions(-)
> 

-- 
With best wishes
Dmitry

