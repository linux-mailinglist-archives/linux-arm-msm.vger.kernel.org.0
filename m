Return-Path: <linux-arm-msm+bounces-117375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DIlbDiQ4TWonxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:32:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C683471E550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A0OuYxC8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hwNUbABF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117375-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117375-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 434CA30065E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 17:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4609C2E8DE3;
	Tue,  7 Jul 2026 17:32:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72734FF62
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 17:32:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445538; cv=none; b=Avrjs+ofKqRlbFoNpfJo/tUbuzQ2KDaMnSVVptYrSxRoGIf7DCZ2TDoUSqPJwS1pSnV5nhKg6DkKYQ/iLI4Kqbl5PjLW2a09DHp4S32J0Q32FRJjfA/QQU0uqEGY5NrgrGeVkbXHg8IJYKfHZnXvwJPHKPYAUD0mRUDxswFT2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445538; c=relaxed/simple;
	bh=z2BrqT1TZqjZ2tKMyPgL3jkW1h21itc9Q58yZOnfL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJtoF5r9lfMEH4f4kbR0rfgjOL1T8gb41IVQuVPd0uVj42mRzNRIPd5aH/KeExliw1vOf4aJzkX/PotaqaDKau715+4FAEHeE0VRDe3Yo+WPriqjejkEcoCRuqvvc3qIo8lXihQMIHoHu+0m5jgSruqn5skYEk+xlsyEKWzKiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0OuYxC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwNUbABF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT88f017943
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 17:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i/5dMbKwjsswdhyd5fOvdXcf
	gT4EgegSnmhW70q1q0M=; b=A0OuYxC8UsvBO5G3voFGhOchX6swxqxZ14zgkk9e
	R2NwGsRH79wAVginGBga/QFDH54c2cz6b1ojjOTh8AU251huM11SClOkmN6a495Z
	7ODEFC2Dywsk8LCvW87gIYVFWLGnEl5V3un1ULnLB0y8JNBkxTzUpWs5jzlxxqHU
	FVNMQQuDELhTbJTqKgqn2UzIwhP3zQPd1W0Sp47EbQdlu4sv/pxyBkp46CDBoQ8O
	3SEvzIhSoTm0eyB1VKQhXZw7oLynQLIuBu1tMxhBvQVyS3m0+cPamwJsO9QGI3kZ
	qw0QB+Wk4HvJpVRATRn/8ixuuzH5JUwFgs73TsdMLcni6w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2f6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:32:16 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692aed16feso3904921241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783445535; x=1784050335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/5dMbKwjsswdhyd5fOvdXcfgT4EgegSnmhW70q1q0M=;
        b=hwNUbABF1ERErZK+6fZHvuFeD8/0LLil/2z2EpnjX4oC3/T/1HWyUXEhNseamNGQhu
         hV+sKmQel9zOVif2drR2CXGnHjwwkaLZVHoszCAHh1M7swS1YvpUKhHLi0ud6rtJbj1X
         3DzPnE3mUnJDvVR0O55sTFohz5AzCU0B9Gj0AmpsDGVYY4pZqWo0wve6h9nuBguKYZJc
         Eacndo5F/1NWgTfRCrnyGmQMH3CMUyEhHUBUMr3fet7KsbsX0knZyOtWctiKU6L8kRw3
         vxaUMqpZz4JXyslsW4NUSgD6RgX6MReXyrCcAJs5NdkRY79ojpj5zDx8Nr6KoS1SeOhp
         cbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783445535; x=1784050335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/5dMbKwjsswdhyd5fOvdXcfgT4EgegSnmhW70q1q0M=;
        b=V2iCgGPamjtA3iHpxJgQMEiz7u/8PUkE5eE4lo7G8HTlIQi2h04wKK0UEKv3ilL/zr
         nRoJrb9K663AH16CKzQZEcM/NeLu96mNFrJRjSJAwia23w27PL5yHB9au7RtVk2YTWi5
         tpLGWvGDtAi2DpOfrYv1E/LKdn6vpN4kioWnjpcBL9vZAPZxSpUmTwWTiQStIiUP0bJr
         FSvAo/yI6fnNZ+Y2XfaXOdijyH+WIVK7sF6SrwzDveyNMsoeMZrrzviSbq6L6I4KkUwV
         VXV1PK6CtItnKLebZG/vzOh4xgS0QpMJnMuhFntXBqfqixv0bsJdbOW9fFT4zNsqHqYm
         ujeA==
X-Forwarded-Encrypted: i=1; AHgh+RpMYFnWwMVv5Pig0zbQ6MqP0FTjhk6p23w9r2p8laiysiH3WmDDmpoe7bUmEsPoBs/yIoHhZNfSpN3KzH9n@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPgNHgKK3OUNSeveVRgGaAOol8qp7+fZBOEK5WCrH1/vXGRBv
	Yg6ztDZUh95k2ZNBTB04bDtUQ2saBaM71ZTvca+6smomE/P1h3+ZFSkBPc0gsV70sLfNsLOzRu3
	IBUi8XqJfffEbI8komJg4yZa4ns+JwYDPLsZD2/QM/L2svIKRN1Kjf2G2TEvOo/4uOQtY
X-Gm-Gg: AfdE7cl3cZN2WKlVdlIYgvf0JCAu5Zk1TfqkOEIJ02W772N7pgYkwXrUDzpIi+u48rf
	D/p11tj+CnhPtPOVBKKEPK60sh5UdbNrvRxkLkJeSQV5YVYwBSuJqrji13tuNL8JQMS5R6U3hnx
	Qr1EDd2VC7zUTOLEG+M3xtwaU/vVIVJNcU83aAsGyIW9NBGHU7+671C1GSmzIOdQX5R+Jfy4INJ
	swbK0PqfKm9RG0qMQklzHTIDaYfdhKnaC2oAMIfDV0jrO2bBzkwajcwU0Ky7zbfa5O892ORUi+A
	0NiCTHNcII2khp+TatoxtNODGk1GuvozVETSv/zzRPGzfp8fRr3XiRWixqDPMsKlIKcheUaPP/P
	s2J/PUtx1SHSp4qN1SptVfQ6/PCfGqtCjyRMHK32dbwMLvS6CYi1I6zP9UXJ9N98M577gn+X/vf
	R3oIfGGPx8wFzHGzAfhajhqAIM
X-Received: by 2002:a05:6102:c51:b0:733:844f:3582 with SMTP id ada2fe7eead31-744b7fbcbd3mr3885130137.27.1783445534953;
        Tue, 07 Jul 2026 10:32:14 -0700 (PDT)
X-Received: by 2002:a05:6102:c51:b0:733:844f:3582 with SMTP id ada2fe7eead31-744b7fbcbd3mr3885102137.27.1783445534454;
        Tue, 07 Jul 2026 10:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm3906698e87.16.2026.07.07.10.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:32:13 -0700 (PDT)
Date: Tue, 7 Jul 2026 20:32:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <zgps75cqikv7atqealqsmg43bk74yfp3c5hsuced3m6xfkwgdo@ah5sr3vkpade>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
 <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
 <ccc65b99-9045-438c-a4b3-2d3577f281b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccc65b99-9045-438c-a4b3-2d3577f281b5@oss.qualcomm.com>
X-Proofpoint-GUID: ryiCR2C54dFv5eLRRCybk84xAsjBhx1o
X-Proofpoint-ORIG-GUID: ryiCR2C54dFv5eLRRCybk84xAsjBhx1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3MSBTYWx0ZWRfX40VtIiw3pae1
 6W3NBcF5gkIL4DXI3plcpAdG2umJVmMDfrs/b9LdLjVfwFOIJweqHL9FdejvqwgE9fSyhk1wZT6
 ObbNCe5El89IpTjhTwFQssdMZJVlYEwpgCCfIFKHcwlq/86gZcAMWlJtBDRAnCa0lzjWKBW8W/w
 aIVZ3yOg/srwpDlh14+5n28mp/SUqhddxkfyec5CxcG1sY7DOXxLu1EJ7hbRDkYZXgPy5dkgTJu
 LOrev96nBKvK9F2J5y5j47FmhSSM5ElYu1NiPxCpbPMNJzxZxTOZkvfuQ2ahUaMeAAbk/iwJGMz
 YVtwH2jJW8vm8jnTf4vZjNF2VpCzEtzEpVQVcLKAzG2WplDtaq0WReNMRRIzcAT+PJjNZTqbile
 AT8uLaD18hEYJYKremgl8oiyIVxTvtH+t9U8SjB7+si62bDdpT0bEWAnGbyY2S9JmcaWkladhV/
 Fu5hykKvd3hraoyLiqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3MSBTYWx0ZWRfX1us/cJNVJuVb
 8TVpKpMf/jiEiAQV6eiOTMIEOknbRZ9Kj/TMyFE8ZRjTPcaVBPCsFETBgxak5EgXr7j9Ifq1GCr
 2G9OQC1eXWShhVIOVXwYGDmlR3ws2z8=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d3820 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4fwGljYRTM7ZxNbho_oA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-117375-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C683471E550

On Tue, Jul 07, 2026 at 08:30:59PM +0530, Vikash Garodia wrote:
> 
> 
> On 7/1/2026 7:19 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > > > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > 
> > > > Introduces AR50LT  buffer size calculation for both encoder and
> > > > decoder. Reuse the buffer size calculation which are common, while
> > > > adding the AR50LT specific ones separately.
> > > > 
> > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
> > > >    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
> > > >    2 files changed, 438 insertions(+)
> > > > 
> > > > @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
> > > >    	return _lb_size + vpss_lb_size + 4096;
> > > >    }
> > > > +static inline
> > > > +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
> > > > +				bool is_opb, u32 num_vpp_pipes)
> > > > +{
> > > > +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
> > > 
> > > pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
> > > "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
> > > other.
> > 
> > I think, Sashiko pointout a different issue here. Should I be calling
> > size_vpss_lb() to take is_opb into account?
> 
> The comment is generalizing the ar50 with other iris variants, we dont need
> that for AR50LT variants.

Ack, I'll cleanup is_opb and num_vpp_pipes from AR50LT code.

> 
> > 
> > > 
> > > > +}
> > > > +
> > > >    static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
> > > >    				 bool is_opb, u32 num_vpp_pipes)
> > > >    {
> > 
> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

