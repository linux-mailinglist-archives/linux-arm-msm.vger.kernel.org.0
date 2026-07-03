Return-Path: <linux-arm-msm+bounces-116186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Rx5BLRhR2rwXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 572536FF774
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MTvYnH/5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EGfMCgvf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116186-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116186-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21F563014100
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE5D35E1B7;
	Fri,  3 Jul 2026 07:11:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702E373BEE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:11:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062703; cv=none; b=PhH461qlN4inPUbMOIkXqmiI2vbDwLGVo2SAu6ORGVnrZgqZvyKOHn1T17VqAn7QssnsaJ6buOcr2lx9ZsLogvHx6tAgqfXYNABZZikSIX1XB+JxazQ0dXIsMc6b6RcanlSi4iL/kRbquWQiKlkTyXTCYWG6nhV5PGwe9lhAbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062703; c=relaxed/simple;
	bh=nrXTpxV8sNkGJrT4dxWYKlXe93h3GEQTCy4NeH6xDXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ7MKg9wZhM5mIpS12znXzr5BmiFuRW5AqJnqyJam7STlKIsuZTrazdab8xjdWDb1JRNBABrtFLOUv+YBrx5DjdkZ00VxPsybJmtXORi7MLKb4sUxVb87s9LjyABt0vO8hLRg/XTxqx839e91BrOalC3fyAB8luXzguN6coslFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTvYnH/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGfMCgvf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s2ZZ3126832
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=; b=MTvYnH/5k9JYMr2m
	qTN7JGPcwNpy9jnDlHxJIMhH6dpKWgQGFBnWTElNlMtrkRjcZjhXrkPfqe0l0iPi
	RNOU3xSTsBJcCP+GVT5GSldDP08Ls81eqrvdpQjpGoHIdcKRsX7p3Qq1IyVYFxtE
	6adE6PRzi4n1mgMZhJ8HH76+4VmDq8wEZrog3c/8yOL495XgQa4w0UUW8zZBhqHI
	N5YA71MDorPwo6iQtbYy9CHj6bhxo7ZbRhr41GJcGWZ8myPYtamrD7z9t7x1vu/I
	lpHjULpVbRP4imjmycaC2PWqF3GE14NUt1oPB1w9seqMCqE6UKUJBE9/Q7rlY9ec
	NFFv6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnk8d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:11:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cbeb53so5671485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062701; x=1783667501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=;
        b=EGfMCgvfZErmykzBMbgBH6Cn7XrxnD32Q0JeN7hpW5zBo7bCRu9o53Hy6HAjGNqUyb
         yzALifwGWfh6BAGxEPgAiLC4CRoQ1xVeUGU8lQKczx+KtGLJY5OdNm52l99QeanXxlkS
         MFms216yQZoT6xwhDAE6aeDGC5jy1p5RTLyNCDPWQcDaq5zgpPdYuon7IiSOgoEHewSl
         BA1IoYbJAE5t6xf6KTOnyqKL3GREw0s5x9iz2SIBbLKTJYGflCFkZREe1qCy/mOBhz2Q
         XPM9a69dASeQYGH4ppVCOx+d5tvndwwq8aHZAi4LvXvQthe+WuD4+Y/fX+OTAm6NgmLJ
         EhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062701; x=1783667501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMPwHUTg1hOJ3+DDxHnE1QSlEaPxseIJLLS6opdgGNs=;
        b=F8/UoPf1DoOx0rHa2L+NtBfcEXNL3EE9UBnwqI2eKW+5cp1jHLIygR1vjvh3TlC3LX
         AlFbkxSDu89vX/7gj7j2Jm/DBIpxnJxYFR1fLb+yroJSSgpWFUJnwNvbgzA6YwysmMkS
         oMCiby0mVPYc0bQs3LTxP1pC26L7zrdGTH9PsIV51mytOqMKb9WXdR6NHmzFhtSXvrUB
         VSzQtaSgBBfxYVSbhIgWB7kqc6iYJp1GoHkiGjmy8uEHV6A9yKuZdN2ePDs2CxArknSP
         1RrZczs2t4f8/mLWaCCOZERrUZHb1gxVwwmKr1BL80+WLCc+23ftDo8SQhxDD7/Q3l7N
         e9vg==
X-Forwarded-Encrypted: i=1; AFNElJ+pqYOpc1AWBqr6KAIvXxB2SfoB4xlZVoy+g6BG7EjQthkfccS831pgRz687flokN8A3l6LmRxhDcoEbXge@vger.kernel.org
X-Gm-Message-State: AOJu0YwZvD0gz9qQOGZ4c2ZeGImZq2Lkz8Va0YhkOz9XU8SoKQKhpDiH
	kdOSYJZGMVIVSKYO6jsWwJaiJG2PC1OassgadXGzViUuHdnksldbbA0NraeXgOgI+ZvNWMBzfp/
	B3eQpEpvQXuxCa5V3Gif0wTixaPmM8f2z47E7E1viguV8qFdfj6cPXF3tU6KB4xEK+ybe
X-Gm-Gg: AfdE7cnnyELDsjYXqN8ki+a3nW7KZgm/rJfLQJILRJOs9bPsw5L4x6d2kizt4X10S/L
	R+75JA0srlrtTPuWgfRYlUOLdZ3kBFrbtRBD3tQOVVG7xgaRSrX7vKrHNyMCgrV/0LroSe3UUTK
	IygJMdqwnjq9AjhhVVDUgNJP3rVfYVo5BrTPnz3xY2ll8B9xAemOMfVKZ15DYIXBXREmizmZhqQ
	6RIxjSopwazCahjmUUtXmu+RG5k4ahB3eLr7CipZL3/6x1y/rqLD0HF9rPAh5jltkfM7zZAD+U+
	XL+mCbisIkNqx4LRZf6GODB86PcoRiFhzC7T0CyCYJcQsVGm3LlkALRXOqRVZg6XK3/oZbhJ0DH
	/4acXGm/5cIYa53MchSXOrbSsCZAaAkBkYyI=
X-Received: by 2002:ac8:7d56:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c26b505c0mr74007821cf.11.1783062700698;
        Fri, 03 Jul 2026 00:11:40 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c26b505c0mr74007491cf.11.1783062700217;
        Fri, 03 Jul 2026 00:11:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c6f3dsm234829066b.52.2026.07.03.00.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:11:39 -0700 (PDT)
Message-ID: <578fd547-4ea2-4e9a-be90-dc765e449da8@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5nq-NlHfh4_OggFSYbnFAD_jPxeGLiLA
X-Proofpoint-ORIG-GUID: 5nq-NlHfh4_OggFSYbnFAD_jPxeGLiLA
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4760ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX2GBxxGUUG6w3
 D5qPicDHbvIVhx01+LJZRTqv/37ybn6lgYvIv4XbxjNdIHtrzDh/uRNGkZNRGzhBxc8/r9GUtLO
 i09mlOVzVXI3l6TNBl3Uey8MNzSbRSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX7vNuka0NVRuX
 +9dNmv5gKgjCgKgX1UcJOuhe1gx4WRgnIxlRpllGMhGN+kWxtDlNZxq/HoXOEcoyeSLR/DO9BRO
 r1wlEKFn37qZ3r0Bc25+OZEu2wo4a2IcVXFEuF1znvm6EMKQ90ZqDaZDjzAGwsQIcSymMVm8Ha/
 ed+gOR53XaY9mTsbG5Hj82A00JvZ4XtOYWkwq7CYuS4HhKMlL9X4oKa0vKziHGlqwnh+TGMog3S
 Y4k/cDjp2dis0dlExMKfAoqs8kefcqow2aR+2I99Y5F/IkFS0PEAlKLZGERx1kZUQPUx5ZF9l3O
 w7pgZVvcrBwI/Px/OCh5VmWQzo1ssxmLW9Li2m6SrPrUB6UXi6+2q4UbMZHcjWcxula3jK4/oRb
 dIPcnl1YpjgeXXToQ1fbAthf6ipgX4EIvnvCVt18pp1ygk2SdmS4/gRkpySpVu2NrcW4dfoHaFX
 XbuKpS3ubHemz9ZaSqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116186-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 572536FF774

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

