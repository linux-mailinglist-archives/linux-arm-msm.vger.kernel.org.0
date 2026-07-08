Return-Path: <linux-arm-msm+bounces-117683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAqLBAhgTmotLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:34:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C67276F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PyP7HEO3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KysYUSt/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117683-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117683-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C5F130D65D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A2E47CC69;
	Wed,  8 Jul 2026 14:25:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20847887F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520717; cv=none; b=s1CwHU379NU7slq8FacqJyH2CCjBVD5eeHpIRPy0WAOfh5iybwJFGZipMg9t0ZtMsrQobbSog94/PAGvZ00iPIU1/NkYM6gy2M6jS0omrjDqfGLVZkulBtGAxUziPKtOjeEfzfZnCPOWlOF575cFsZPnWMkQQjTA0NPzEyDK64k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520717; c=relaxed/simple;
	bh=sSmsdnmJrwAPWW1KiyJRt8MCa+4Zum/gNQgF63z/D1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azUMloxi4EVsGO+Gg+9bynTWJnAtxCsN8p0SOWFZP5X8BtN+W1l/fDNEO6PoyCgsEo3kec5gaL1I5u+T4cRPdu3zOSx9A4AZUj7AaAXgngpTlHKwYkq98j2E0/kMtzY5gzegNRWokMJ5zsNfQ9SeOQ8SALS+PEEEoDUGZJgrzx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyP7HEO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KysYUSt/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7q7m2677957
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvPOfAqnErBt8ztKSYP7B2XU9RLRHl2bIpX+eaysQj4=; b=PyP7HEO3JF6XT+gG
	EJuLTNmpvlkCRZfJUJSEB8ReOvor7VAA44TxaSxdLDVWeJhZ6vdU3jOojmVKBHtl
	ks1eKw/63ND/vu+kjFJcAMFIQVKNeu62WpXECEAsV+Zx5uViAopvuE18Hue+ETs6
	vSMurlyjcDwN+wwrH9JXxDvSlwPsxelBvAnh44CsYBtQIlnLvB6Vc4pq9JjgFEnb
	B2REVAaXWJDnIJtMRZK9aa5158Eyen0EhQpPn7Sv2N+wEe9MlW745VtzHyXR3x8f
	crwjvf1Bhs8ylRMHihreF1s8nJw2Wg7FZElD+gi2mcfUVv4Bio04PUNzn4lAMJl5
	EttpbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s8ahc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:25:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so7302031cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520714; x=1784125514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvPOfAqnErBt8ztKSYP7B2XU9RLRHl2bIpX+eaysQj4=;
        b=KysYUSt/n7df9m0u4H206uG9MrZS1BzYIxUq55BC+0E4SJSU1QFpj3u9vt/pp3zr1m
         MdezqKTfQlOvoAB+ETVxmqibI14Q92FSWj4nqF3EPcOYyBnLq+hzkU5VMUBun6Z00+yR
         +nYoxfH7jtgRhq8wjCSHftLv0BfUf2kzPkObYqHspPM1vCR0LRWN+TnANX7LAuTMIykT
         vHNnY0nhnJrUr+CyFefENO5ZLizsQa47ty4tB6s75ZguM6YB2dTGhG2tXWnaEv5BaiFW
         qfLV97345i+i7wMLrG1Bt6I6GJwJgIzFdURmfHwfBXknvGOkyJJMlG2x+UOczRFVoPwN
         VUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520714; x=1784125514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GvPOfAqnErBt8ztKSYP7B2XU9RLRHl2bIpX+eaysQj4=;
        b=ZnbKxMCMgKcE0a3E0JVAtAO0a2GKt7IKl+b49tKfrUfhAk6FPBL+r911wCzfgW0EIr
         gWgGuBCHD4skrDAfvahGcEIfrvtNJixfdD7+XsrvNuvKYxq20hGHqchFdnrVFLEh5Inl
         +bbeikJoa1a2VA0BIHMne8LYiIzSETqheLCsPWLvlzEWmrekuYK84lQMWJ2ws8nfWNtv
         9GDDJFsrafZc8cyCBN3W9spsqIMPEUbUZnpN9/Akydjp07O5wbWNhanv98V/Vtd9FB/d
         SGsfkg8heF5s7X/BwUnHdrWIVeq3FEAP0XnTU4i6OkMIa25o4KO6DlsS0z+Sr4dU/oem
         bxwg==
X-Forwarded-Encrypted: i=1; AHgh+RpB0uC9wvcRCKyRnLyEE8scXn4zKuwwUjasH+ppgov9wut3e00259IB9kuX74o8cXtJkVo0gdIYElVL7NJE@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBJIlaEUqrZrx6EVqkBqnZ2H9zT/koTIHODNgnOg+3+WF9nyM
	KQalPuNKkC0NsJlmrMqvT7g1qVKx49MXZcKtnydUUKUFf5QGUnpJQmyUfu6Ry9kjJeCIz2JUxxH
	vPkHWz1tZhpX95mMPEm9mNdiLfSG6hgvqztrNywZMnTb0Lz5h2UmXnp2beMMEHUZZTVVA
X-Gm-Gg: AfdE7cmVPwG59H6Vrbqvqb2tqtUQo9Hus/4rfMIGyLWTFxOTkmZSpnRsO1s9OhS1xg4
	Mgm71AId6MiAqd1axyYA0HQKHi2qXDt3z3fy5eKT93CjPNh4+GYUsW+jNTAc12vurjNh5+F6C9/
	L0TBwGP4aVpZyx5gWHrO3Y+3Hh2HyRKJlPo7eUoHAESgjYuroq5aSEzRlO/1KqELoEm9e81i+Tg
	cs1lEQHwpK3MOcTOCHhTdUaTFDqhSoig+HueTXY8HgjUtfGjlI/rKKEI3dQSK/sliONn46tbQrX
	7bhuSi39N5bNNdEN5VUsLVxK4ZGNdVWxGhwJbzlX4tJYlX9wYWClXKEmcJ9OeprKFF7m/Sm3SAd
	6i8XPM3RPHbaEajAdg57Iw9xPlMy91nCZbzo/hYWGDIiBnugO8VxjS2xp2812GmTzu1FE6hrsK6
	/Jxrc2d+IQUMDo8WMUueUM2bMp
X-Received: by 2002:a05:622a:1e1a:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-51c8b3cc299mr27193361cf.44.1783520713586;
        Wed, 08 Jul 2026 07:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1e1a:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-51c8b3cc299mr27192631cf.44.1783520712722;
        Wed, 08 Jul 2026 07:25:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm4527420e87.66.2026.07.08.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:25:11 -0700 (PDT)
Date: Wed, 8 Jul 2026 17:25:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MSBTYWx0ZWRfX5t2Pa77wNRPT
 hH/BWj2whsVIB82IjqcDVbaXOlcLBM18bhc4y4lx1qHpSdI4M2D/z1QZ1E04CNshkrbIvqBkwxx
 qzyomvphh+UadUqA1EIUCSXQGe2V1pBaTw0XMAIuh3raqjPeZSM73GhXqMnqowA3FciK/DcUb/E
 2gyB9o8RiwyB48iFoNX1y0QxdyEzNVMROqDrC8ICxZ+9r8uFUro6VgjkiemJ7ELgrXTsBZHC25j
 vPgI0KGT+erGyQeCOOXR6ql4Ac2y4nZJjVkwpDC7gEF8Yd3ZqcY0AeKpoiPbqkhgOwz8LV1LfMH
 Y58rbDCoULkf3H5+VqZ6PSyji1doMV6nubqG4MRHZ4/xXjzoXxvXAj6x3ifVdmF/7Q5PlDv4L2w
 ZerzUj9j2orbZ4IvWV5/o0qukvW4ekPUtaHBxlLY3cMCgn7Tia3lnm5fP4y/VSf6GJapgBqwL4X
 cXN7yCjcWOU7dsHb5hg==
X-Proofpoint-ORIG-GUID: B4yo1iC91EKCFOafFR9u4cI8Xx14c-CC
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e5dca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DU7i0n-ryPtEfpeWOdgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MSBTYWx0ZWRfXwnBwVdVQ9juC
 VJrw5ETwg3YymT8OBuShLNQIi/73v7zvxVxHkiI/v3EN3qnoiIja0Vxo9d2Busdztpl5KdtjS/K
 LMZMFTJIkY7tiNJb3PRKir1bNQ/KrbM=
X-Proofpoint-GUID: B4yo1iC91EKCFOafFR9u4cI8Xx14c-CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117683-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988C67276F1

On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
> 
> 
> On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> > > On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > > > 
> > > > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > > > 
> > > > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > > > 
> > > > > > > > >       <&phandle device_id min_state max_state>
> > > > > > > > > 
> > > > > > > > > Define common TMD device index constants shared across currently
> > > > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > > > existing DT ABI.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > 
> > > [ ... ]
> > > 
> > > > > > Why are you using only those TMD devices?
> > > > > > 
> > > > > > > More constants can be added as needed.
> > > > > > 
> > > > > > Kodiak is one of the supported platforms.
> > > > > 
> > > > > What would be the benefit of having more than thirteen cooling devices
> > > > > declared in the thermal framework and having only a couple of them mapped in
> > > > > a thermal zone ?
> > > > > 
> > > > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > > > need to add them ? Can we do that incrementally ?
> > > > 
> > > > That's what I am trying to understand: why the implementation uses only
> > > > the selected two devices, if the modem on Kodiak supports others. How
> > > > can we find out, which TMDs to use on other devices.
> > > 
> > > My understanding is that is an initial thermal setup. Gaurav will add them
> > > step by step while setting up all the thermal zones instead of sending a big
> > > patchset. And TBH, that will be much easier to review.
> > 
> > In such a case it should be noted in the commit message and/or cover
> > letter.
> 
> Thanks for the review/guidance. Not all TMD endpoints are relevant for
> kernel thermal zone binding — some like BCL and cold temperature are handled
> from userspace when needed. The constants here cover only

What if there is no userspace? Or the userspace is different from what
you expect? I doubt we have TMD-speaking userspace yet.

> what is needed for modem and CDSP thermal zones on the currently posted
> targets.

Again, SLPI, ADSP?

> 
> Will add a note in the cover letter clarifying for current tmd's.
> Please let me if this is fine.
> 
> > 
> > 
> 

-- 
With best wishes
Dmitry

