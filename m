Return-Path: <linux-arm-msm+bounces-95286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIY3MwUOqGk8ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:48:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6C1FE889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 11:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC5B4301BC1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 10:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144923A6F01;
	Wed,  4 Mar 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOGNH2RK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYqRE3fK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9EB3A6F03
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621286; cv=pass; b=I3HZH5Wk8gnZvy5l7NtYto6xua6mTkfrTWL+aP37QrIsthAgUZdGNId30yxaBR3cqcCiwS4lTF17Q15DJ9mke+uquLeCUdZ1U0uMyacfNq7VI3CzafX+5PcXXWBJfdpRlWYshENNKpP1TndtmNBU9r1TPvkukWWKbKe3CMuBsL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621286; c=relaxed/simple;
	bh=k6KRKIP4TZjViNcDueZ4+NGt/5c8kw4PHq86rmuQtLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxnNbcSwiHIIuXFQpkboOHTyBVqAUQlJAa5Ob71//CCFDdObpQfjMSHpRWOq4q26U7j7jpV+vogDUJLRmUJRgcSxZ0TBcb5gOtG8u/xsCOCHWigYvLFhVnpkpvJacGSovWSt2Zekm8I+fRtM8VMLaUYUXYzKq/DnY1UKytRpnLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOGNH2RK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYqRE3fK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SeI01422277
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KxF8SRYe32RdPz36NUB4WnL8i7RMkq+6Nsv1V3yEmU=; b=GOGNH2RKr7U5Yrd1
	519L6iO4mJsnd/3w+X8457FbOmsNFpVAEGM3pJvzO/IBEvxlPKr6XIBlHHKe4ktA
	iWW70rpAXJt1a4mhfkggIBRyse0kK8wh+qCGY0D77rxTVrbk25+pf1TQHH02V3Q/
	eY9suMXfe4lGoJyToziA137uH83QfXi3+0uF3QWdybfq/WM/Y/AE5odhjBVCFfGS
	Sxis7gSiYs21BWaKQW0jSgPVadH3hUaWDcPQUgXGvFBsq6mMPWPXl6NqEDG+CHOX
	+7nxugdugfxD0OsQVx10WRNI7VfN34ZIITmgBwUh7De6yS9wV+GDfej/2AXelkM0
	eVSkSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u141k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:48:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6e5b909so206337376d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 02:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772621282; cv=none;
        d=google.com; s=arc-20240605;
        b=PveV1Kl1O6XVL/BFilcQaaLWsUQyf5XtAoVF3mDxJAyARornpsmhG165RQ8JP/lVeM
         /QDNg3Hb4vNOdXcIQdpqwtn3OHMJqRUIuItdu0SkgsOqoOrXMPWRjsXakCk70KemYF9J
         vMsViqW4R3VJIK0I87eVQUfIEyS/Pk4PXR3oitz9TH+1i2tCIWOXLw4XFJxEs10yuny6
         U1RrplPGsaIFnyC4gPyGWgHuhRW6U/xbEFD9PHceaLcA0IBZyF3cXaPIXlhMeoMWFUFB
         TQciCj8yj3C/nH0u1AlPKak+WaXPtq2vSQt6Do5uLYtFBuwZtqi25dR0oJOYL+OmsMRL
         PTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1KxF8SRYe32RdPz36NUB4WnL8i7RMkq+6Nsv1V3yEmU=;
        fh=AprX/l1/r8sBE+CLK4qKRcgS5IYvbbRcaDSfvdkxdwA=;
        b=HqjBWSHBV89OD8oQa3f4PxGDcS9a4dn3Ntjvy8dAFJzujHTUqCzJrz2Y627P4oEqxe
         ApG+wBNfcIpenfKXovW/mXQVkuTNyNFrWxuPO9TKkvnP/1giAmBcn3JLH24BnQainfMr
         fRBufD/PD5IACAeNYQMmt7tz+7UAQuq7khhhAaAi8RV3iQYeWzyKiq0nZfyrrBQXckCN
         8xXkPFJbZVdmyumZTORzEEpjt6vog8Y2KO0tSSbZyxDYasy9c1Fwghn9YBC5wTX65Q4y
         165WAZEudcpNv5ufclP/bvCqvewJQWhN5QGPbl8ky34fPJgrvVajUp0e1O6mBd6puqkx
         glpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772621282; x=1773226082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KxF8SRYe32RdPz36NUB4WnL8i7RMkq+6Nsv1V3yEmU=;
        b=JYqRE3fK4GjHIDw48vUm3a9KLGesec9XteaYvEvL3xPkRiS7TTuLk3mdcU4aIaF0rU
         xJsJvmcFvzfymTRFBJ16L7j5bDoKXcmI1ZK1VCHVaJ/c/b3swwEdZaJR7adhkbBeJrzw
         t1f6uUt7yJl/yfwREzQK/0ck/Xx4Uils3FlO5N6Qt8x6EqzQiChbuZryv/7N0xyIw9HO
         SHbUJYn19a0N+N+zXH8Idw2Q40948Nk+lslnjiZXA3fEgL64B1QwaqECRvF8uASPOjCs
         nbDkhweZ63kcXELpak/3Way22CU3QoE55YKxu9zjSUgvFeKVBpPP8pqI0oKORX9zvVX4
         1v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621282; x=1773226082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1KxF8SRYe32RdPz36NUB4WnL8i7RMkq+6Nsv1V3yEmU=;
        b=qbncyBY25U29rhNf7xBs+pOGP9qhhbhf0ejN+HoGM3g2G2lkX14NzjLDbrUsLQDwa6
         jUhn1s+UtEHtboZMlSFFMOTjMKoaPram2R5OfxhC37cBONpo3ss4Qvp2pad3EqHoSEw7
         A56tJUXXN839QYssHEDZRtsyHYgYic2UydHK9upafuvg2plbYWUPXZnUhD1OjFUrHfj7
         bFX8+PupfYsXxfJ5pYSl4sv6TbvjT4hLzPtL7LsOwq8FBab7qtTAgl3TshdRv649GrJD
         mKGrYgLNnGI7HWAcLn8JJ97/mWDRyLpAFZAqYPj8hAsqKyR0XJEfAn/t0Hup3CSW4Eru
         PCoA==
X-Forwarded-Encrypted: i=1; AJvYcCWIyzHeHeNeWJ1PpdpuVSoMpBLGPnVCrIJTTguAuAxPV2nnRTx7q4EZ+0Qx3lckZPuiJ9bvBrwvDgKfar/L@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7oUroTuesG209o0HpXb3v0ijs39mztPAGrWLjUoMVYLo3hOX
	YrRuw5TnEs50Hy/tepvVBBGKQFI4PfBRaQAJEH0U8h/PdI+0kZ7VlSM6VkiNNowAfOGP2s8oyxn
	fk4ma9uDnPmm8xQXC+5HZXZdShGh9N6H+2Yf0EzLURQ8Gej5/dacheYRsO8SGtEsBLRq2rBmbOF
	dvJmYAre/m3y7wDzf65mJThDu3RWG5FrHyYq+n8HMulUI=
X-Gm-Gg: ATEYQzwN/AhU8/CNKNTmwtiyyvNGjPNWAmCs8JHQ4JRKz+HSd2izbxj1GByHTWz/Awr
	8QgBfqfgK06bds976w0jfDCA+NuwI0s+kS8PijrCkdCB5fsk+POOuVm0BAoX/yzIJWtwktNXDq4
	H+pqa0mECiX51JYEpdVj7K8a+ayFqNqAW80WUT4+u7uAn4ndon4PqhuHusn+b8wkm8pjgjqXQjB
	TBx05q5pEujWmt8AyEVzuln25bxmdReLhqtIaYo
X-Received: by 2002:a05:6214:d89:b0:899:ef7d:cea0 with SMTP id 6a1803df08f44-89a19ce507emr15717216d6.44.1772621281988;
        Wed, 04 Mar 2026 02:48:01 -0800 (PST)
X-Received: by 2002:a05:6214:d89:b0:899:ef7d:cea0 with SMTP id
 6a1803df08f44-89a19ce507emr15716956d6.44.1772621281445; Wed, 04 Mar 2026
 02:48:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
 <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com> <CAFEp6-1+t+672=Oh8nvjMAEJrV_sz2SMzh1WeDNowsVzdXu8LA@mail.gmail.com>
 <CAHz4bYsyZyWrC1t_osVDFrKDX7Wsc8mdcr6bMiigUDUnkOSQ9Q@mail.gmail.com>
 <CAFEp6-08BQZKGeW2P4WPqYq3V69um6QTnE5Gpd+cvT9D-zsj-A@mail.gmail.com> <2jcrdz7tj7cuo5j77n7d6nfxlo72s35njdig6lytbta3vzo4m7@wegza7xjgcxo>
In-Reply-To: <2jcrdz7tj7cuo5j77n7d6nfxlo72s35njdig6lytbta3vzo4m7@wegza7xjgcxo>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:47:50 +0100
X-Gm-Features: AaiRm52lXRGGBfpVsm-gH5eY8R45ToXbmA3y0ej6pyjpx-x57sdiS1p33QlRDjs
Message-ID: <CAFEp6-1FCdAnjiYn4fXJdrndytm_bBrceCbK6XVPfxvy7baoHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary USB controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3KppBwXARVczRH3d2V9fgEUVMkOMYGcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4MyBTYWx0ZWRfX9JAxzcpf+xc3
 MQ/bpz2EL1h9INLQjKf4eI0PqWnQ9eGFmqf+yp/XRcf7a9WmNxuErzIUnC87u+QqrfdbJmmKPi2
 KapOo9rYe2JYQVzldGtrKax6K/oiF9/lh/QFPn7mKG9UR+TuZGQd/TXR9OYIBAgosVATgHgxpik
 HjGxnBO6HsrvzSmRi8MHM2+mnbXo3K+lioFs0WQWXyIZNsqVNjBo9Lx8+JmefPurVCVohytQa5Q
 w6tIEJfY9nVlsJPfkWf0b33SFAcV/ruZ5z+iB2Ua88+kbDaCALR6bKKBbbow6nSP4ZMElsT1Gno
 2eTt8QY0gIODC6cY1rQSbbgkYOul0ro+tNszB6a0RTJb0+u9FgSQupoGSuXYIhuLlGv2vaRB5iq
 8K/rHgIPJVMn1TzI38snsVNAAWsGpp79uvYv31H+nOUbo74dr94/4nTH6/sfi9OKmkEcY2y1urh
 Xcrp26+K6kbOGnPwlsg==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a80de2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=S_nBkAQNT4dCZKHrMJQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3KppBwXARVczRH3d2V9fgEUVMkOMYGcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040083
X-Rspamd-Queue-Id: 3EC6C1FE889
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95286-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Dmitry,

On Wed, Mar 4, 2026 at 3:22=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 03, 2026 at 08:32:36PM +0100, Loic Poulain wrote:
> > On Tue, Mar 3, 2026 at 9:25=E2=80=AFAM Swati Agarwal
> > <swati.agarwal@oss.qualcomm.com> wrote:
> > >
> > > On Fri, Feb 13, 2026 at 4:15=E2=80=AFPM Loic Poulain
> > > <loic.poulain@oss.qualcomm.com> wrote:
> > > >
> > > > Hi Swati,
> > > >
> > > > On Tue, Feb 10, 2026 at 4:54=E2=80=AFPM Swati Agarwal
> > > > <swati.agarwal@oss.qualcomm.com> wrote:
> > > > >
> > > > > Enable the tertiary usb controller connected to micro usb port in=
 OTG mode
> > > > > on Monaco EVK platform.
> > > > >
> > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++=
++++++
> > > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++
> > > > >  2 files changed, 60 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64=
/boot/dts/qcom/monaco-evk.dts
> > > > > index 03af9bbcacc9..e6fc6f6a52e1 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > > > > @@ -27,6 +27,25 @@ chosen {
> > > > >                 stdout-path =3D "serial0:115200n8";
> > > > >         };
> > > > >
> > > > > +       connector-2 {
> > > > > +               compatible =3D "gpio-usb-b-connector", "usb-b-con=
nector";
> > > > > +               label =3D "micro-USB";
> > > > > +               type =3D "micro";
> > > > > +
> > > > > +               id-gpios =3D <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HI=
GH>;
> > > > > +               vbus-gpios =3D <&expander6 7 GPIO_ACTIVE_HIGH>;
> > > > > +               vbus-supply =3D <&vbus_supply_regulator_2>;
> > > > > +
> > > > > +               pinctrl-names =3D "default";
> > > > > +               pinctrl-0 =3D <&usb2_id>;
> > > > > +
> > > > > +               port {
> > > > > +                       usb2_con_hs_ep: endpoint {
> > > > > +                               remote-endpoint =3D <&usb_2_dwc3_=
hs>;
> > > > > +                       };
> > > > > +               };
> > > > > +       };
> > > > > +
> > > > >         dmic: audio-codec-0 {
> > > > >                 compatible =3D "dmic-codec";
> > > > >                 #sound-dai-cells =3D <0>;
> > > > > @@ -77,6 +96,15 @@ platform {
> > > > >                         };
> > > > >                 };
> > > > >         };
> > > > > +
> > > > > +       vbus_supply_regulator_2: vbus-supply-regulator-2 {
> > > > > +               compatible =3D "regulator-fixed";
> > > > > +               regulator-name =3D "vbus_supply_2";
> > > > > +               gpio =3D <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
> > > > > +               regulator-min-microvolt =3D <5000000>;
> > > > > +               regulator-max-microvolt =3D <5000000>;
> > > > > +               enable-active-high;
> > > > > +       };
> > > > >  };
> > > > >
> > > > >  &apps_rsc {
> > > > > @@ -484,6 +512,16 @@ &pcieport1 {
> > > > >         wake-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > > > >  };
> > > > >
> > > > > +&pmm8620au_0_gpios {
> > > > > +       usb2_id: usb2-id-state {
> > > > > +               pins =3D "gpio9";
> > > > > +               function =3D "normal";
> > > > > +               input-enable;
> > > > > +               bias-pull-up;
> > > > > +               power-source =3D <0>;
> > > > > +       };
> > > > > +};
> > > > > +
> > > > >  &qupv3_id_0 {
> > > > >         firmware-name =3D "qcom/qcs8300/qupv3fw.elf";
> > > > >         status =3D "okay";
> > > > > @@ -690,3 +728,18 @@ &usb_qmpphy {
> > > > >
> > > > >         status =3D "okay";
> > > > >  };
> > > > > +
> > > > > +&usb_2 {
> > > > > +       status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usb_2_dwc3_hs {
> > > > > +       remote-endpoint =3D <&usb2_con_hs_ep>;
> > > > > +};
> > > > > +
> > > > > +&usb_2_hsphy {
> > > > > +       vdda-pll-supply =3D <&vreg_l7a>;
> > > > > +       vdda18-supply =3D <&vreg_l7c>;
> > > > > +       vdda33-supply =3D <&vreg_l9a>;
> > > > > +       status =3D "okay";
> > > > > +};
> > > >
> > > > I noticed that usb_2/hs doesn=E2=80=99t work properly unless refgen=
 is
> > > > supplied. It may appear to work on your setup if another PHY or
> > > > subsystem enables refgen, either explicitly in software (e.g. DSI) =
or
> > > > indirectly, such as through DP, which might be voting for it behind
> > > > the scenes.
> > >
> > > Hi Loic,
> > >
> > > Are you facing issues with this patch set? or your patch set that was
> > > raised as below?
> >
> > Both. I'm basically running Debian with kernel mainline and your
> > series, booting from eMMC.
> > Usb seems to enumerate a boot time but is then unusable.
> >
> > # lsusb
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> > Bus 001 Device 002: ID 0781:5580 SanDisk Corp. SDCZ80 Flash Drive
> > #  dd if=3D/dev/zero of=3D/dev/sda bs=3D1MB count=3D10
> > [  225.248307] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to
> > stop endpoint command
> > [  225.290186] xhci-hcd xhci-hcd.0.auto: xHCI host controller not
> > responding, assume dead
> > [  225.298385] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > [  225.307748] usb 1-1: USB disconnect, device number 2
> >
> > It starts to work if I add the following in the monaco-evk devicetree:
> > &refgen{
> >     regulator-always-on;
> > };
>
> Interesting. Could you please verify that PHY is not being reset or
> powered down at any point? Unlike the DSI, USB should be voting directly
> on the refgen.

I don't observe any reset being triggered, and the PHY registers
appear to be in a sane state.
While debugging the REFGEN registers, I can clearly see that manually
forcing the SW vote makes USB work immediately.
devmem2 0x891C080 w 0x1

I do not see any other votes asserted in the REFGEN registers, except
when connecting a DP sink. In that case, USB also starts working, and
I can see a corresponding vote appearing in register 0x891C064.

This suggests that either our assumption that the USB2 PHY is voting
is incorrect, or the driver is not putting the PHY into a state that
triggers the expected vote.


>
> >
> > # dd if=3D/dev/zero of=3D/dev/sda bs=3D1MB count=3D10
> > 10+0 records in
> > 10+0 records out
> > 10000000 bytes (10 MB, 9.5 MiB) copied, 0.7521 s, 13.3 MB/s
> > # No more USB errors...
> >
> > Regards,
> > Loic
>
> --
> With best wishes
> Dmitry

