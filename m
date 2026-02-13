Return-Path: <linux-arm-msm+bounces-92749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NHeBofTjmlFFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D6133965
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A609B305F213
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C422F3C10;
	Fri, 13 Feb 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyrv8dt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgrgXNPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4562D97BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967939; cv=none; b=T/DhiYRkuszqBv8CP8hNXKfGE1ZEjO5YZlYIHHV+wZg+JRfvyqE/bXrlitovmPKGbZ6EwHwhjwdLVEpbeJ6t9MXKpFLNqFF6ODnLXrix7nDk8oW58JLA2CuPJi3KfGSbITscLDpdtecLIlPudnBz+QyWpQaWWoVf8guTGBJXcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967939; c=relaxed/simple;
	bh=KxGrcbG7a2AbG1ZzfagulwCjbri6LMG/biCnPE2s2X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qb2FE5Xd5KG8VVI39+UrDxZ4Xpm2a0i+c7Eq+hpz69hflryEzRXJpEdrEHrj2kNfzms7ccryDaPZg6cgtWXRRx5A+iexc7rZbw1EA8YREvwDZDUpSh6mmuqMm9/9CgfAg9FHycHdxUE67Pk1D18HXIz/q7Am3k0OYxwkDU5PquE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyrv8dt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgrgXNPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D4hUV91756592
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v2kqgpaQTaqY6+39WGQboDU7
	g1wqPRchcEVZFWkpBCw=; b=eyrv8dt+nlV9kMvHcXvKRtLeD/dZnh2JrqClaRxR
	dwhtBjTDxBR4piXkVuTw1or9wW52FhEuEIm+29zfAoOqiadeRlmo6Sgb1/gKleQH
	AT6TUKFvyukTrmurQEfEK+O0xuMZ/NCzJPNdWghIbYXytpv+rnUoLm2Wx2pubvO8
	AwW9+8GMFFWeLtJ6qnZNuxrfnBzJXPzmRv2ElHd3h+R01veG1S3Y8x0/8GVRoQNT
	A+GPV0RXxqoDbozN5/F/o2fwV8AuHO6ih603PbYqEmMU+kkmmfsyWsad+JN16x/h
	MfNsMnfOwl67wCRqR3RvNYyMszP+qE17jg1YU+mHOfssBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb12b8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:32:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso2165453a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 23:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770967936; x=1771572736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2kqgpaQTaqY6+39WGQboDU7g1wqPRchcEVZFWkpBCw=;
        b=HgrgXNPjNRNqQSgCLUULg/FSXGcOoqiTeO1W35T8NeTtPlcydDlLc0S9/KL2jnhLdv
         0hitHtJQPN2tBLmJkd1YJ6qqHfV2rQrTU2rbZqF4/U/cmu7kYEaHiv5PWHlj+eDSvm1k
         CBGhiKh35KBH9B9Il+LEot2trrZcVShywmoI36J7YzXUeP6RzbxHD3csuufWXUjDAC0A
         jgk8ESOo13ivhejhvvHJcApNOKgaJsuUBDfygjS0ILa34ViEw1t0Bl2j/VcKKvEAN4vf
         1n4JElMcPph+gbL09V0Z885Txlb/nkQDDT/ElXhGmCPz/bzrHu34Z6ay08miFJuA8Kah
         8DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967936; x=1771572736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2kqgpaQTaqY6+39WGQboDU7g1wqPRchcEVZFWkpBCw=;
        b=S7dAAW4LycC4CisjelwlafEogs7qDtsvtQP4heFFbMNeawOL8K0E9W+IhMFnSm4VI9
         Dtt1jJHvHxjUssARlvOPhFtupeWyJ+wwKhtwDrtEaalYS98M1ssnP3G/r81vU21Tz921
         vhBUONqqHv+qBkvnsnHgP2zfSJ2F6XEHJhaV570bSNLK5777zOUx+10aG6ml8vGjORYK
         S2Pl8IhXHryv8GbO1gGTLCZxTZDN+c47CF/zU6to9mVSENXji7lfZPE6HGSpO84sowrw
         3B5ju3+d80RzOaE9th9G4KanOEXDH+Ne+262WZdUZTbLgpIjCjT9m/QUHbF0ZpbpGBx/
         80HA==
X-Forwarded-Encrypted: i=1; AJvYcCV73+Bb7sfjCxMue3tHqipMgwXb8UUqGhDUIgqKRP92hrpyfgXXEgI5U31ib4RbVtdzb2CC/Qc8cSZ/7oUn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jY38Owsw0UiQziQS+G5XlAvOet5Q8hIgME2HrWD/fayabbvL
	4RLvwWGp82I2K83FJ/fkv8BTPXcQ7aANvb7ouLL50cXnmE+7G2XeU2xG4IP4Y1INOt/iRifABhU
	U0Mfu/cazHAVsvLtgdy9GkkgEhi1eCQtawYB5ZfevyyPA+hBFxJzXtyw2l3dP+3x1JDI+
X-Gm-Gg: AZuq6aITVqKqbqVwpK2SHfUSGTNTlXVYoibFe1bcDE+Uthkw7Er4iPzc1X20+3uAtxl
	ATAtC03mC7zQdiqIgFg01WVNaqbUGlBGjSto+KltdKLG2AeurWPSow/XP+rdoQYleTxi1UbTsYp
	tlnmV4yqocNys+Yqq8geMvcHHPDy0C/vkkFdFyze084DjjdrYn/Q3lZPXWTckkb5yY7WfAxfc9O
	qxzGf45xAa0FzV/LtuNC12W+bgtO64427RdaC7LOu3DtKp4me2txngekcqsP64ufpKSJzpKMQKR
	LI/NV1k9/8kj/7aHozL96ZsjjApV5uLciJVJeytjFTSeXIt34Oy2o60sTN4DZV9M9KhkaT/QEAu
	mudBoSMZO996iTWnp1fxhhKnQH28GZI35ZNk0+cuWa6fIBG94GyAdLGixjRM=
X-Received: by 2002:a17:90b:586f:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-356aada1582mr965988a91.28.1770967936244;
        Thu, 12 Feb 2026 23:32:16 -0800 (PST)
X-Received: by 2002:a17:90b:586f:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-356aada1582mr965950a91.28.1770967935771;
        Thu, 12 Feb 2026 23:32:15 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b6a17fsm1831435b3a.34.2026.02.12.23.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:32:15 -0800 (PST)
Date: Fri, 13 Feb 2026 13:02:08 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aY7TeBcMicmvFvDv@hu-arakshit-hyd.qualcomm.com>
References: <20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com>
 <20260211-enable-ufs-ice-clock-scaling-v5-2-221c520a1f2e@oss.qualcomm.com>
 <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfbe04db-bf64-418b-a75a-88879bf0bf2d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA1NyBTYWx0ZWRfX98aXHt0CDyks
 JAqHTC2BhS9ptyyFYQJ4xavCquZRMlpx12I62AS4g4jFC9lNoCUHwEyBCVn6fadwYMIMoje7SEK
 xI1zkPyLtCYTxmZid1Sl5psKPQekLoJUrBLpElqfwKIzDdUAX9rwPU2+hWNPd23jdZiK0PJzcol
 oaUjBnr6B/+xcvP2ZdqaiDLiG2CcttK7oQiIDH6UXjvz0RUishe0V6UmuOVClJhVnaSvdueJyyB
 Bc9LGy/AVe6OYfMrqPWM8lqz9m211f3nzxguL8l0plG+hNUAQOuK76EC0gZGgaLiRugJtb1Eea2
 AKMfu2WbnfYPs0VoWZfaOe+safAXFd1Ivt7hGuh+qsVByMftrXZl1Ri/EfZdKw0hr2ppD6cHgYZ
 2DX80AterCXXdNKFgsQ7luuRS+NGe2JAoZ2F55i1XzFSelfuFSNAPcK9v+2Xu6bh6s2COssO5wC
 D52NecUkatzuEDNFDqQ==
X-Proofpoint-ORIG-GUID: Rv1V5K72oFUw6dGpSCRdVO-oJ5uiFwLl
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698ed381 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=GuRBVjywOiuAmw1d6-8A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Rv1V5K72oFUw6dGpSCRdVO-oJ5uiFwLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92749-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF7D6133965
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:30:00PM +0100, Konrad Dybcio wrote:
> On 2/11/26 10:47 AM, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > and aquire its minimum and maximum frequency during ICE
> > device probe.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock based on the target frequency provided and if a valid
> > OPP-table is registered. Use flags (if provided) to decide on
> > the rounding of the clock freq against OPP-table. Incase no flags
> > are provided use default behaviour (CEIL incase of scale_up and FLOOR
> > incase of ~scale_up). Disable clock scaling if OPP-table is not
> > registered.
> > 
> > When an ICE-device specific OPP table is available, use the PM OPP
> > framework to manage frequency scaling and maintain proper power-domain
> > constraints.
> > 
> > Also, ensure to drop the votes in suspend to prevent power/thermal
> > retention. Subsequently restore the frequency in resume from
> > core_clk_freq which stores the last ICE core clock operating frequency.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> 
> [...]
>  
> > +	switch (flags) {
> 
> Are you going to use these flags? Currently they're dead code

[...]

> > +		break;
> > +	case ICE_CLOCK_ROUND_FLOOR:
> > +		opp = dev_pm_opp_find_freq_floor_indexed(ice->dev, &ice_freq, 0);
> > +		break;
> > +	default:
> > +		if (scale_up)
> > +			opp = dev_pm_opp_find_freq_ceil_indexed(ice->dev, &ice_freq, 0);
> > +		else
> > +			opp = dev_pm_opp_find_freq_floor_indexed(ice->dev, &ice_freq, 0);
> 
> Is this distinction necessary?

Just giving it a second thought.
Well right, these are not necessary, infact we can completly remove the scele_up
from the export API and make use of the rounding flags eventually.
The ufs driver can pass the right flag, based on the check against scale_up variable.
Ack, will update this in next patchset. 

Abhinaba Rakshit

