Return-Path: <linux-arm-msm+bounces-91697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB4ULAkigmmQPgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:27:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE5DBF2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 17:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00AE63172F31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 16:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB203D3007;
	Tue,  3 Feb 2026 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0xm6nR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1i7Bd5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2C3D1CB1
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135616; cv=none; b=pzh2l9PasjJb8U+NkldgspKjyKljVQzzCMSKNlDLWflTNVQfnFgkPaTaJ5MaiG/F7N/lDdxJMvkpXn5AsfkhZ88+hS7dGADcz8/e1rxUeu35XR25ZXN/rkK4LGy9V9gi00gHU+8cOGF9YKxcvOI+vdJKmPeUIIw3nywdn0H6jbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135616; c=relaxed/simple;
	bh=pkY7kEHabn6xUVVhbcI/kRXeiFgPK7iYlXE34d69vXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLUtBkBY4Hq4ediGM51JCSaFJTAppKMi+6iSD9/cPnTYa183/zoouyLVejcCsbcw+HTnqf8rZLfFfqj7XrNWpwEIjXZBB/li3c9SPVrVVUsrtcXV2sMSQap6GiDK0YHCC2gm/iEymBFQc+oSubMRbCnNArfpbFK/7bLQrdyT8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0xm6nR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1i7Bd5k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613CAAuG1191802
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 16:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MhZYp8ry51oqanqLXhZjUYAA
	KFbxXcvV20gtwBm4V/s=; b=l0xm6nR2spQZULUrCJEgZ/uqSYsXeKNCn0oWuj71
	r0mEZuyIUxCjxtxde/4Q/FLIUhY8460+l7LMTAWf/cN0X41k/bI8Kg9aqJKfPxfm
	cf0F3qectnIyUt7pI4DR/gJIN28to9hyjwlUP7kTXFNj9n5qtG1BwKx89NyAVjNR
	eboEKv78eCkws/ELDvMZFPovPrjDNdDlqYIDCRux7BFh1vo7tT6xmj8fwPdXYVyA
	H9Od2VQ5cRQei3L3YlILa8a0qQHw2YcNDy06rwPdn9HNB9Kor06LLHcimwXf8mAn
	Zw3fupdJ2ES6nHigmtCElFtwd+7KXu4KAHvBKGe7btMhrQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr0r2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 16:20:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso42351595ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770135612; x=1770740412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhZYp8ry51oqanqLXhZjUYAAKFbxXcvV20gtwBm4V/s=;
        b=H1i7Bd5kTGuX1k8R7bicC9+oBHphA/s7RtGYUdcesj/Os8N0OchBqVXUWo53/Gntq7
         drXLpnI+CurRV4WdGS/HDUWvL14S5f44Iblwtx3lwcXXtYRkOQW5RkPqQFWQ0B6ANhKn
         Wnkjxau9UWJGSbdq6SeDUvJ0YGy8xezz6Q30WzrEG9i02ujSqf/oQy0q5uVbeuXx+Djn
         Wl+nFG4qrF51e6qEJnt4aux3eKIDOYpmhV/gkwqK6YDCVc24U7wYD8f1EOihy7oVOxeY
         e/+Oy2jS54Gd2Y2tv4lFqiWzKDAadjddYo/NH0akxEAVzM6kdLV+dudz19LhGeDG+9mC
         1g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135612; x=1770740412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhZYp8ry51oqanqLXhZjUYAAKFbxXcvV20gtwBm4V/s=;
        b=B9LOyMEVxwiuHEDmVHVLz2kZ2f/QcGKE4NavRuAbMv9D5lta64nA3xB7h0eFx4MktY
         Uoy+gDx8CDOYFFka3N1NBbfm/2//LcGRSIZkFUsg8uIWWjQ55g5zdqoeG+iZ1c+Y/dSa
         fOXFbUaWRVNLCXlmdTc2YIxIPIHZCmcYUy6NWYAKk5b2Jt1LdGFW97apOXF4MqnIG27t
         /heeZ6387EoDYzYUIO3GJDIgv6ppyT/m8jlpgV358S/r1asyC/D8roCECogNDuO50rA5
         1yTZyozIf3VHIREK4O/PXYgXINeo86kRQjju9C9P2mYdaBuvo39ULXRqV9JwBrpiDHRy
         Ly9w==
X-Forwarded-Encrypted: i=1; AJvYcCU7tD/c1c1tDZ4pFkN3pHrthBJellETZCEuDi/lFWlioE7+E5fexnRqgnoDs5SmSiiB/9XGSz6iQYIpJeh6@vger.kernel.org
X-Gm-Message-State: AOJu0YwKDHd99cBf3VTITArSc0qNeRbxDly+bjEuZIOFQGJoHBYmQ/rU
	F7W3TSH3im2qozVvPbGO63+uxqRzj7axGQqROKxIOlDs2i4nVcgWeVuLfi3Hu4Vs6tbQHJm9gw0
	xUvQhGqm/i4XQFo+Mi19srRhQ4oRN723maz/l3tgkNgByXzPKG3/XCW9m7sk7/F9g6lfy
X-Gm-Gg: AZuq6aIpqwT1k2N0y6/GsrwNtsRyJqFkIUwgkeHBVcOFNmeLY6hMytXSWwRSL42ZrEv
	zyX5Th/z0dSFD3zdhUhhRPMVmJJ9s90K6EZ074HCqqd2S43MU5fhhKXS7k71+cfD+tcuoJYWa71
	ziI3kA4EXCGDgoPJTgkStiPl8YgNJRBfkOq322a6/8MJXTMAuFpLuyNR1rDlRXNgvjO6txpd/gG
	/vpnh9Fux2z/bmdZ2eVO4IDIgnHb1K0ub16IABw8dKYkfxXp3K8RgGkRTJdM7npI+j4SJPbU2YQ
	nSbwNRt5IK15cnpt/7t2HEn1kHCRgAq6hFkRV/00BfBJIgb6SK+Zp++eI85VsjMhQFxVgl/oC9u
	h0OEYhjmhdsbckUCYqh5DRvACErzcVHHWcZGsF7w=
X-Received: by 2002:a17:903:1b07:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2a8d96bc4e5mr143166645ad.25.1770135612435;
        Tue, 03 Feb 2026 08:20:12 -0800 (PST)
X-Received: by 2002:a17:903:1b07:b0:2a7:9948:45a4 with SMTP id d9443c01a7336-2a8d96bc4e5mr143166355ad.25.1770135611965;
        Tue, 03 Feb 2026 08:20:11 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630dfa2sm74858a91.14.2026.02.03.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:20:11 -0800 (PST)
Date: Tue, 3 Feb 2026 21:50:05 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, lgirdwood@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
 <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
 <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=6982203d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ckApwMkLgAkK_VoyvOYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 95MkMBM0O13TKVwt5-tj_W0i7fHQ3M-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEzMCBTYWx0ZWRfX5PC2RBlhYSDv
 Yg3InXULE81cKXl0C4sr27SjbJwaQdPUbrhCsQHHkx7Vpix1BZnBM21y5bxPr7ZG/jgggu8SOAP
 ndPNDL0EWS16ARLzAbPhm1BXYLFCSjxzc9YoAmxglm6hcMu/Q4xSBKssX4wgccjYWFVTR/JenMU
 0q9ITJXPfaV4kGhILJaTG+px9ZvrlIhbRJoxVDxNDe9Jwy9WbNMwE4kwbBOlqBb6VcT682L4UPo
 ctT67ptbAREby7rZX+vUE8jI+ekbeRAQ7sODjzDx7vRlYEuhyoSuASFT9lDgyDu7vUE9tr2uRXw
 SbQ4dkEAiu5Y7j7f0HC/RrEHZJmYPjckipcknug9w7EXx2kRsTXOonsJx28/izWt5FMl+/peZKR
 fxkeoYrlXsv/HVzMTYRis4xkusjCfYGqqloEZ2gn5Ra/eBqpkzcJF/wtGLkXyBoJOeroQH0pQsQ
 iiiCp8GrwYCGBdTlBmw==
X-Proofpoint-GUID: 95MkMBM0O13TKVwt5-tj_W0i7fHQ3M-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91697-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2ADE5DBF2F
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 12:05:38PM +0100, Konrad Dybcio wrote:
> On 1/29/26 7:15 PM, Mark Brown wrote:
> > On Thu, Jan 29, 2026 at 11:49:42AM -0600, Rob Herring wrote:
> >> On Wed, Jan 28, 2026 at 12:32:10AM +0530, Saikiran wrote:
> > 
> >>> This property is required for platforms where specific rails (like camera
> >>> LDOs) rely on passive discharge and need a mandatory off-time constraint
> >>> enforced by the regulator core.
> > 
> >> Does enforcing some off time on all your regulators cause some negative 
> >> impact on the ones that don't need it? If turning them back on is 
> >> performance critical maybe don't turn them off in the first place.
> > 
> > You might see something like unexpectedly long delays resuming a runtime
> > suspended device.  Generally I'd say that if the delays needed for
> > something like this are long enough for anyone to notice they're long
> > enough to be disruptive.
> > 
> > Having said that I believe an active discharge feature in the hardware
> > has been identified and is being investigated, that's generally a vastly
> > better solution all round so hopefully this change isn't needed at all.
> 
> +Jishnu, Kamal
> 
> Could you please confirm whether our hw can do that?

Yes, we do have setting to enable a strong pull-down to discharge the caps
in OFF state, but we dont have the option to enable/disable this from the
APPS. However most regulators will have the pull downs are enabled by
default (I'll check and confirm about this specific LDOs internally)

But I'm wondering if this is really a 'slow discharge' issue, because if the
caps discharge slowly.. shouldn't the rails be turning back ON faster
compared to when they are completely discharged (fast discharge case without
bulk caps)?

@Saikiran, Just checking if you did some analysis from HW side for this
issue.. taking plots? or may be removed the bulk caps on the HW and checked
that that issue went away? (or was still their?)

> 
> Konrad

