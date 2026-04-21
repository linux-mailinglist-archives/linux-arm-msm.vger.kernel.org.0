Return-Path: <linux-arm-msm+bounces-103912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNDJKexH52kF6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:48:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCE4390FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73CE230164E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594283B6341;
	Tue, 21 Apr 2026 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BN1Nl+6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bad/Drc3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44283AF670
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764865; cv=none; b=j75a+GqjvDJkSb1WiWrEu04Whx+3dpm6rY6hqslIG7yrKMUPpUTu3rlwn+CpeVScaYf/MNA02JAlY0y9M0bro1MYF8N9FlSkdoDDA40lKwVSC5UmKA6nRzOAyGyBP7eexA5+R22BE21hhrtIgHocsh/1EoRYcQf9C+NXT+fRsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764865; c=relaxed/simple;
	bh=XCzMwu+VSrSsRKyM9hqbWJ0NJLSUSXYFoX9vFw2xnMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dymhrwhttMRC8+ajAf/jH9UI7xKB3SeWea4yQByl5PA84WoGnczeWAHGlrwfRpv+yQYtQMkKM1AukI3q3CMNzEvC3Jii6HQsQZbnkMo7qQiulOLvSgQtgfLjufaY7FPxYd8ijib68AKgzY0ap1PQERR/m8TVcPjppE0Kg7iN5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BN1Nl+6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bad/Drc3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4Xoke1511261
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bzypbsgrGLtN3L2XKMzQHpbD
	jSFeghXA9pfP3uWmz0A=; b=BN1Nl+6cs5JKvOsE3gfaIwJD7h30Zyhu11rNBbMK
	nzwhaizSx65c4OSe7nNkA4tRsGHAcWLlmP69S73SBz3olUAVRcnO0YG9ORTqrIut
	i/Jogrwa+MI3HlrUhFBDB4PY4BY6/mwusKx8b91PN3Q8ph9VnJCBMSruU/o3wGJX
	1x9ZwIEZ/uEya1QMwXT2Q7wQvIw6SPXeTI7xMtbFq1dPVeWcoFfvQIefkY+7rq7W
	xD53tV+kI14KBu4cTxKVHHl+NopHYiznjTQIiyQTuJP7QqVXOYaHbHcWoGwhBnDS
	KFKUckI/OHzM82iA1AYaAD2B3MST5yWGaW4oTvqoHW/QBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak161w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:47:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so5255560eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764861; x=1777369661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzypbsgrGLtN3L2XKMzQHpbDjSFeghXA9pfP3uWmz0A=;
        b=bad/Drc3IoPIvFMnm4AILPUC9KMTswcOPEWRQDA7jVM17J9z6OA63Wbju1Bj062ujy
         zh1Qt2z83Nk7DlrYHWebVM2NNiLT2hpE9riegZcA49DRvfo+ZBlXSeOgqbN0IiQAJ3Tn
         sEP8qzItzYcfCMuW5+vsR6rh0xdbaJdgiKDbM73USfzQbq2sFwEQFoYE/tRwXp07iazn
         dzVMHXwqXgHOb+Mq/yWfGuA4Zq6t96MHteKPVv7BxR4/KYj2yIn542gjTHa1JslM6JI5
         0ZQhbWNVUwmlJFWVqMYobLM5/n6ZxPs/uRVoQxXc4FHZWKNjh/ESUuYeB7/UvZcLoBDJ
         m3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764861; x=1777369661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzypbsgrGLtN3L2XKMzQHpbDjSFeghXA9pfP3uWmz0A=;
        b=FA25uGMjf3SdNwVGvuKudQ374md3ikDKL2FuUkgNPbv/XLmo3GclqLU1v2yeRrG0qc
         Cn8SaXGJtC3R5j4Va42h8ne/se4LTK9ox4QeZkWTx4fH8tqZ38GYL6km4vDgoXv/n706
         +cS6WX0y/uGOzikOxZ1/K2umBmILapkWDqHqc/okYfFqHJqQma6eIcL5PCpY5j7oZi0l
         rvdi2wa7fusKVyoWYJ9UC6n5UTdwpVIDbuKrB/kn3rJWq+rVxNzec12Sq79kS4kjrlNa
         /Y2aNmlyoCFEuRpvrm/uet4KNQ97/4goLi9FgcdjDSM78QjOeoTyyqYpi5IuuwoU5Wny
         3jEA==
X-Forwarded-Encrypted: i=1; AFNElJ//zYhh9DafzhbNWS1KuKAZqNc4iBlj0vTCpnqoIi4oyMbFTv8ydI793kUjYGm5HjGRQFawNHO69xycUUlO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8ZdQvmOFPd27q4bahuDGjwGTno1Ok8OiSiV/32hB/KGaLaB2
	eEVzlhIRxkfqrwUC5HrcBGKpqycwkrS4u9yi3qJxGiNmwG8itCfTiz+dow6alDW4szGVvGCbDFk
	utPLxtWJwgu3RuPieJ8693IiSqS/YLSYq74TZ5N2mtoKdorqhvl2++j9M8OP+S6zzdusT
X-Gm-Gg: AeBDiesSycwYiPyDOO/ILIjjYUNtN8LcKqdlyRKoUeBEsudUfNt00z1iKhWpF4Xybza
	9XEMxWZOvtuCMG5uB1eZ6YAK13JsvmcqvuGckePq0OBU81AEBPeWsNTRVGA4GVFzuqwU9loupVk
	PHQslWnswYcF/oX2Gp/R3V0xZK7bgeTaraZ+OElum/l+WOOlpk/r6aBFhY5TkIMm70kRZ52auNx
	IK8snfuegEH0mRgj3os66L04ltRaoAwAZvVkDUYwZ7z8d2tF5GgNVpm9Cs7ZS6mFWF/VPtM3+sK
	Ix/by89uY+IaevQRqAn9YolUQ6AXDaMcO/qmLs0/8VIlmqvm66UC4nOp0Ent29mxenmZt6ktBMf
	75d+9aS87hb8em4ef0pW8C6QPGkJAy93R61U6/iBq8iudZ3V5uzZpk8eKn0lQx4Rau+yXP1S8tM
	Zlfj2Plw==
X-Received: by 2002:a05:7300:d704:b0:2d8:b814:29af with SMTP id 5a478bee46e88-2e464dafab3mr8147903eec.3.1776764860724;
        Tue, 21 Apr 2026 02:47:40 -0700 (PDT)
X-Received: by 2002:a05:7300:d704:b0:2d8:b814:29af with SMTP id 5a478bee46e88-2e464dafab3mr8147884eec.3.1776764860158;
        Tue, 21 Apr 2026 02:47:40 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm17768209eec.25.2026.04.21.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:47:39 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:47:38 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Message-ID: <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e747bd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rm9O5cFRvSUGPMVy4iMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: yhpuggJ8PXryk8o6-c9ZcywWIaotslne
X-Proofpoint-ORIG-GUID: yhpuggJ8PXryk8o6-c9ZcywWIaotslne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfX7IsSWM6qzGSA
 PROvVxXOB8BZdo4E5+OVgp5GshY4NS/yB4E2ruaHywQgWlyuP8RZcSG43XZmmob/WzXqFhYv13I
 EWdwjj+jZo+Lle6bkrDJILu3/8waouIQJNi67TJHzgguD0CNrfZ2blHEfHd3e4gRk88mHljgCpN
 DNlsdix8fTHw3N92kn5dVzTCjcNYZxt61tRHnCwK/l+i9fcsDDGryGi+wpKviJDBGh7XSq+Xcdc
 PB5Plhv2QNGlUe+FNNBmrJadnkmrlH1U4IdG7rqM1WH4WzqzvqByv3v6+n66hLQqCxKbaoDF10/
 lZSI/NxBLQYeabWINiBIIffUOceA7kYm1SPTI5gEt0n271c92zhX8dOw0NyCG9bGILypX9NY7F+
 EpD1f97hO2o4/f+ZWAJUqxtnleEvHSLJ+h2gdWaxMLdGLdoTMFqn8hYGiZkXQTmDkHj8m5HYs0u
 3gDQvzkbp0A/HJV/f0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,0.223.255.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103912-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25BCE4390FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
> On 3/27/26 11:24 AM, Ananthu C V wrote:
> > Add an IMEM on glymur which falls back to mmio-sram and define the
> > PIL relocation info region as its child, for post mortem tools to
> > locate the loaded remoteprocs.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 4886e87ebd49..21ae05f0ee17 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -6457,6 +6457,22 @@ rx-pins {
> >  			};
> >  		};
> >  
> > +		sram@14680000 {
> > +			compatible = "qcom,glymur-imem", "mmio-sram";
> > +			reg = <0x0 0x14680000 0x0 0x1000>;
> > +			ranges = <0 0 0x14680000 0x1000>;
> 
> size=0x2c_000

on glymur the imem region is a 4kb region of size 0x1000.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

> Konrad

Best,
Ananthu

