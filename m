Return-Path: <linux-arm-msm+bounces-103891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGuiGhMr52nv4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:45:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2710437D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C343002FBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EBA387373;
	Tue, 21 Apr 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nssmuxua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gibOWwPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B133384249
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776757410; cv=none; b=SHmEBFmnRoyEWPq5HZEuir9hOSIhQEb0p9ud0VTPe3h2A4xnopEOjahQ3BNTIR3tDlPqocpixVHuTnGNaDym+2TCT6X6Qzfe8DiMYqoiond10H7PjFp05RZx3ToK2RWiuNk5iN6bwOh0VPJCcItuU4gf5KxSSE21RbrU7sA5hfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776757410; c=relaxed/simple;
	bh=MMSawpn3Giyo2ZkRVVzNqV1zerLp7+QOFPFRA8MFXjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr68A2OJTyTarjL2n/ksKhE5WCD+FgiFcEbVwmvigGXGUR3YJidEfcofpf/t8rJZJDWRz3n4CaVwA3QOKxctDZ9b+/KXRMLqkC4Tq3/fCYvrwg4H09zYzt6Tvp6edyN7rwrf1djbGYKuncYR6rU1zFS68dNX5N8WrZiwyJzYg6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nssmuxua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gibOWwPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L30Twb046050
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZerX/6IY8zgoCVrD9F6KFOIt
	ZCLdJApcpwQ0Rjf8lA0=; b=NssmuxuaMiwi+pyI9Bzl0uvZYEX9PbDcU9Jc8ZLF
	C0BlwotYShmyUon96TwOkdEHZ6Zcy9z2CbXZJG/RkoT04cnfqUvQUzCT0l0fsF5+
	TWa46aLzuhLOTVZP1ijA/zUNJ1IYcaSzxUxlUx/3Fw3YvB995X4qLup0tdXTCc3I
	dfpYvioUtj5BEIPp19nVbvdcPuTlS6XECTMp8nVNFrY6sEBN4vy/qwWfmBAua8ND
	u5TOCdzbC5NeAwQ3f7KbbLvRj0+Www1s2fCKVS4C6g2wWoeun4jtDTIQSDOxslyz
	SIDydKNDNKYDRgf7SJvuIfApRSowAdw9B3VfuYcpYT+laQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1rxhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 07:43:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5098131eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757408; x=1777362208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZerX/6IY8zgoCVrD9F6KFOItZCLdJApcpwQ0Rjf8lA0=;
        b=gibOWwPGDZrPWhl7ocQKk0lV33bhsl44ST2OnF6kUgtmZu/PfzUxezDRiK644YIoXq
         +rk7PpO1WSsv4dWIH4Bj9orgEW/reE1uOtiNVMdpqIwRYLasbuV+U8KWV6D2vwI43rLd
         59znzCgLtS/Qcvl/ScYX+H11sc8swTsnwBodynNAVUT6tJGq1qmQETj/B3fsBlucmxUg
         CN7ZeNEdqYRHbUdcIY88KBCnNbI3VMhVGykv6m2njSXqJcE9tSXGTDnDxFBXhg5LBCEx
         jnAftgcq2420/EXNgXReD2kmkI5Ll9yG7subf8e3OmkXQRdhtm5yBWwdNYBjQVTZHLwn
         AReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757408; x=1777362208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZerX/6IY8zgoCVrD9F6KFOItZCLdJApcpwQ0Rjf8lA0=;
        b=P0/dhxETfv/ndin6WV0gaMdTD8Q25RUaEBY0u63ti9UkugKY7jkCR6eqKVZaHrYXS2
         4px3a3y9E3xbMJG9mRqaUFOgExT+UlBav9gKUPgeyFF36fTLGwyQYjH1WZjxTF0szy9x
         s0D5BkK0BMguedCYf9snBjJckWz78IuLKIYfjY7vRnwp7oHuez6k3bqwEPGiTSWKIOCP
         /rGPeo4suJuaoWye9cshVAf3um8WLrUitGDMsGHCE8bNPWCYbtI3hIA3L7IsmjxtlPQU
         nzUxOVzQm5FM4EhFJjH0De8Xzj9vE6pTNAKeGdEmx1jtbH83MUgsf/NIkYNteEmWxhTL
         uW3A==
X-Forwarded-Encrypted: i=1; AFNElJ/XqmBHGdNUEDGpNpGxCTdo/SKSvVPeMf+V+VI0Q6g2+f89dO+iNV32caZUitao7qDSXM3i/F5qFTBwtEYb@vger.kernel.org
X-Gm-Message-State: AOJu0YzoM2XWkx9ZCsPxDrhXpfaoqk0ESHvWUrTEDLyTkYZZYvB/UmL8
	93t3Hrgj7pNzsuztExMp3Fj4JCPDvGrnozr7+7gEsEEa6GDRZ7rxTutS/bW384Nn2uYgj9JJuNF
	H9AA7wic9GMA96keShBBI1PQ3U6dejtEW1+/lftAXVQBLaHL+GwqaiP0A6ZCxt4yDkL7A
X-Gm-Gg: AeBDievF8+LYrozNqJD1HvfKLpPEqTg+JdeJN+uszeH/gRcFuqMa/HtZkRT9UFd5EZq
	5TOCQCpkhVmQ/7DupvKDouQh9wR45mP8d5NhypSRW8X+OvXlXW46zilkd6FxamZx30nk2mRWvFb
	vr1vOeBoh2smjty7wZyRoAcqoBQPhh8JAgi8kLElm/RGSlIAFgA6SPcW/R478/gVqk74HnWb6BG
	THAIdoy4hz5lXDZHJjgLh6pwdnhiW3wAQA/b3oKr7Z9SNCiXq0RoWYnLN9qwUjDeaa8oJJ2ce57
	4AP9OrYS/f0eEfbVknYYR6bh1wOxS/6hq+861yASq+D2uFPjbriQ7qRBfj4LZaQiAYtbq8hp64K
	yp5jmTjnssd1tAKNw5ToSOBDQqa5UXQcAKnJWDeoh3ecU2CXpXGFS1NVK/ts7/kAGpJXQmoThK8
	o=
X-Received: by 2002:a05:7022:ec13:b0:12a:7181:2f1a with SMTP id a92af1059eb24-12c73f64470mr8467120c88.5.1776757407644;
        Tue, 21 Apr 2026 00:43:27 -0700 (PDT)
X-Received: by 2002:a05:7022:ec13:b0:12a:7181:2f1a with SMTP id a92af1059eb24-12c73f64470mr8467101c88.5.1776757407026;
        Tue, 21 Apr 2026 00:43:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm16702310c88.0.2026.04.21.00.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 00:43:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:43:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <aecqmPP1J-otyDUz@QCOM-aGQu4IUr3Y>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
 <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
 <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>
 <778475e2-0baf-4623-b927-83bddb0c92bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778475e2-0baf-4623-b927-83bddb0c92bf@kernel.org>
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e72aa0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZ2qk-wzGHh3XmuBoPsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NCBTYWx0ZWRfX23jjBjBqbUut
 vyPMUTFw4ct7ZIkkmV1NZjZzNF3nJkcRIbU1qxDf9aiDMPn98/VRgbofuqdn1CZSB4n5syViTzA
 aqKBN3NM56eD2g7g/R7lmQkJIqgIOT4a8QaUd5wDYcCBGz8ONo2gECzGTz/XkndEWHkxcb/RhgB
 QGoHZYw6/lWqrWokSjhFOd0jC0Xuj5hIIABXNQHY3fadY/57H0Jl9MV8N7JOnBIJEkOgnOYOquk
 C7rFpu3HliTYd70aH6f689j8i8ZYsNN+oYlPnQY6mziaZdjnlkLHaesfWjTEfJwTsfX5t6ocqZk
 jOfJLWIXIBU2sJtAZsWYaVIte7GMaCVdwN6hCD6G7srS0igm+/S3WDVXYjkxNAq5z09e7ndwObV
 1OhAJbnlYB8xKycaYhhRyoPgyl6TB1ySDwbHIspgv13jq1ZSjIhCEXUgfUVeOwy9fe+i2dmIqVb
 voip6UBWFZsEsMtrVXw==
X-Proofpoint-ORIG-GUID: LglZbSB_7imMAZij-tfk5dWuatDpGvZ8
X-Proofpoint-GUID: LglZbSB_7imMAZij-tfk5dWuatDpGvZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210074
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103891-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2710437D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:24:24AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:18, Konrad Dybcio wrote:
> > On 4/20/26 10:16 AM, Manivannan Sadhasivam wrote:
> >> On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> >>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>>
> >>> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> >>> with a fallback on qcom,ipcc.
> >>>
> >>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> index f5c584cf2146..0a86230a2b18 100644
> >>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >>> @@ -28,6 +28,7 @@ properties:
> >>>            - qcom,glymur-ipcc
> >>>            - qcom,kaanapali-ipcc
> >>>            - qcom,milos-ipcc
> >>> +          - qcom,nord-ipcc
> >>
> >> What is the difference between this and the existing 'sa8775p' compatible? Are
> >> they both representing the same SoC series?
> > 
> > Nord is a gen newer
> 
> This should be explained somewhere, e.g. in board/soc bindings or SoC ID
> bindings. None of these are posted, so most of the patches being posted
> could receive that comment - what is the difference and why commit msg
> explains nothing.

Indeed! I should have posted SoC ID change [1] first to introduce Nord
SoC.

Shawn

[1] https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/

