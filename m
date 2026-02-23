Return-Path: <linux-arm-msm+bounces-93743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLUrOqeMnGmdJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:21:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DF17AB0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F9223062F83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 17:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BC8329E6B;
	Mon, 23 Feb 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+xjFPlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7AvrP4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9C329E6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866904; cv=pass; b=LHlMH/FjJC9EBr2osiwTxBDOP6R9lyJDkhhxfYUWNL7psTspx6maaP0vqePSh0W8hGLv7HZAny6W5ExsCh0VJye7VV9LIfDCe/PSmNtwHKJVI2HCc7L90VyjMmypgWZm+D8mftNsem8t+zqKR9B018y5u3rmqJDxWCxtVOGoOdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866904; c=relaxed/simple;
	bh=sivTHWD9LX85++nV1/o9kB35p/6TtEGtO2ZvoL3f5Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP/ZWMIDRyczxz47KRHjb1IJjRAZo08vbjlrC95cgQMhM02lyj9Wahr1vkxJjLLUsQn+uBcqyMl8nlVmt7MHN3memCA43+afiYqWXYvhHGPIZPlXL1mmvTI4EbDjw+/FSbiNt/GNooXlOZPa+1WMV/BDy6qpNQHCyxzuPsuVzlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+xjFPlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7AvrP4+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYhVD322296
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wh7kU6ZDVbvD/9tP6ZOLZ53B
	u1ldM81AwUKEiVq1unM=; b=V+xjFPlXZagKk5j0l0qOtnm90VoROFpw19JzGSZ1
	c5FjEKAQw8qPznNKya7lDKd/1dfdXl05/8Zws1h9KqtAzvmRDn6lp7h7AmrlCQbT
	I5U6IBuIOnNqaS0BYsE3i2DQaHXgcI0XaZ1X4OntdA0xnRecFEScpYE1+EQd+o+z
	pPykmIBnQR6cr5oEFXLgxXiBC5hq8RN0Z1gFAaAgrKLIjGd5E8+ubsmAbGTlVh73
	o0TSuI/A9d+fKAGfd1vOn48Zb0vIBgF8FuWfDXZvYDuCgt8QpIWyZdj6XYbE0/gU
	E+Xu0KJbz2keqLG7y9Gv1P65MeZiNwH0UI9kXT/loSjp1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y18hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:15:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35658758045so3250470a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866900; cv=none;
        d=google.com; s=arc-20240605;
        b=H1FaFfSm+rMyzSnyRJ/awE7iuh8O4y7qS49o5xYpohVVKPM6hT/o5Rybr3zlUQsdev
         Ri5PVoDTljZfAUhC3RAl34CAA+kSKF2X7mlY97/08Zs4GrxZiam26WP3rQWkqsnyFfR8
         HdsSWiierEu8x5MIIsITuekdnxQnn7YlpBAY8XYGt6alHdhLmecmfY8PbEiBjdRcaEgY
         EfQvldHCGF50J3Ic+aBRSFSUHhKGGayKSPg+AeiljucEQAq0Gp3qel9Jgk1mCozFMJRB
         F7TkO9LPuccZzQYDb87ajLwKzwRhFAY0ASs/zGitKyeQXDx+tCgj1iI8fEaB22B1LFYn
         uGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        fh=tzL7XCTDcPnfp+YZrr8umb4ERv2+g5uOUweAEQwpRpM=;
        b=IiEXIwHzsmidDSVxeKhWb0Mal9G8O3GAN2omVtwA2hrdWoevLq5JTOx8wDKpjzTy1Z
         5M7QPZnHIpnNLFkdGM520ox6No5nTRp27T6Gz+vW1/snj0LMGVTSt3iagR0DA4i3APYA
         j+IlHCGIRHO4mtoWzTl1b8C/PkBfK2gOv32p+4AQ71AZJ85XPARvYQQ99TaDOp+UhowR
         8WayztUODjLyHvblRK/5vhYXWHccsNlHVpXhr4y53OYBOHKa6sSjSmDPJ0X9gZ9Ed2I5
         uMQOnFI7dUOGpuC88qTY+lCLDbFcZGcNB2SAemoTDnueiBsjgSj71z5NFytC3A3LCdj3
         ET1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771866900; x=1772471700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        b=f7AvrP4+BVyA4Iv1Ehcyt8FYyiEFXf/OWvlu8ReTCLZTu6BJMUGE/7dXYlytKCG8WR
         NdLDE3viDxpjfmf4hKNgh0cB5eku+RyAss0ZiDly5uc0MB3gjM5Jdu5SX4eKpMP4ie1j
         cVCubcLDpt0Ecu7AaMzHsO55hfCAjALw2u7ow4eL+7sWKxXQrS0YANon8V2dLdbbqrBv
         hoD3IH5uACI7BJ47CPayFu8kEocWxSvND6TqV5QAvO+n7JGfr2TSYTVAulLuyFWpU0Rv
         TGLLBiSI+3JSCAIsrDq3RAWV3xhJfPyGSRT/ga+/UaNxmYvzhvBO0WoLLKkhN5MPcoK9
         73ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866900; x=1772471700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh7kU6ZDVbvD/9tP6ZOLZ53Bu1ldM81AwUKEiVq1unM=;
        b=g4PbjRBk+Q9lItEyBORCN1SW+FEGA/unhZ2zgUIY1xl+rjO24rZnyVl8LMc+fZ97yq
         DBfVFtm9s3XN255ddiCRX2lfUnnnm4CGgZSxYGlbVqrr8amMC0waCzKsJ6D5Yo9kE3f8
         PL7H0Y/QQdl32OKMasxvt78sweKG3w9JdI0KQI4C0MI/TItrVwf7ozYnBmULKHF43Aim
         h3BnzFExVZiaQy3vc9ragOAW7AV5LWh7v0iRPcT+OqF5Mo2VZcrm1DolmckRgZ/+PBVD
         OjoRSZaOoaxJCBkzEuoKZFUhl1zLpNhhF126P91hcLIZdXng3JmkiV/9CxnrNLFD4SO7
         Q37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcAbrojZjmHCMaHgjnwBqb7KdulmY9CapJJBryX7LhJTHyDS4vQ3PPVUU5uZKYvi+mjlnhIY7t/FM5Uvye@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTV7kSW3etL2HWSaIgruG0CwQwLRXVZ4+g/67GxQKPSswsmoq
	XhDeFr0oSPd3l5AXl2IDyYCW7b3aN3Rb2q8HsL4iaLtumK689BEGxwmwg/dtPHju527aYqaD38F
	h94Gy3C5MWG0wV+WFE+io3Xdh5Dx7R1mWHYJ9UPlSIUKjWFID0DUJNOMxGRyX2zsETY9DYjtPW6
	Ap2U4B9+v3xnAfh9QMt8FqEVR5F6yfQ5YFgfzwPwnBZa4=
X-Gm-Gg: ATEYQzyWXp7A/DWjk29VrZGPjF5qSIt+nErraig3FUtIuYbg4/PD1q8fH4FtA8gpbYH
	BPwLeWsFVpLnPE2fIDRSa+fLDyx7Eml0br8OObZ3riWVGraCT5lUjTl+vPrGq7zgg3+u7lD7CGa
	zA6ieGUaPb6sVsIqtg5H5NYbvfuTqoX9u4btOx01Q0PffZbaaryPgh9YrM9jH+SqDDPPfdIAo+k
	zVbuFk=
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id 98e67ed59e1d1-358ae7fd547mr9439342a91.9.1771866900334;
        Mon, 23 Feb 2026 09:15:00 -0800 (PST)
X-Received: by 2002:a17:90b:4d07:b0:356:9405:759d with SMTP id
 98e67ed59e1d1-358ae7fd547mr9439301a91.9.1771866899637; Mon, 23 Feb 2026
 09:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com> <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com> <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
In-Reply-To: <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:14:47 +0200
X-Gm-Features: AaiRm501mLQQ8EL4TUeJKdJtQPxrmINvjfQ-5i--0rLisA6GLW_3SyuzX8m0n54
Message-ID: <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0OCBTYWx0ZWRfX4BupaXSmfVrK
 jWjxUW35/NqGvU3r14LHDvw/lohcRIiqDxxIZ+/T+EtuCwmPqrF0JYnletsCDXZiuX48KN2ogLQ
 fuI/otPiVGia8wq4AhXmBgCtTM2whdMty7zMXasiS8qMh1ifs/w0NO0Pfzt2+RuNwJsI84r0BVp
 htKcu72aGK/3K4Qqz2kqCb06fgpaak7xctD9REeV8gsgwWlrSrSLb6XSYlrFQbUFil2AiWqfKkN
 UBlXdKTMBERLIaacmQpmSBgDX1HqVt2Q6RYH8RAuGLQ/uWOVmRPZGW46Y77By8M6N/qFg/KZjkF
 HQL4aUqDcG/ZEAwfzN/QiwwW08l7UupFJ3k91tpY8j5MaSN11Q1MVMmSQjep39bX6y+AVa8VXT7
 aJ9S3cutKsCWOKgj5Eo1u7FTsi1U20jqUR2EHUZosfl4hQ6htOT+LQlsLxff/93zUR82alAxSih
 y7flhHVn94RqdcshkUQ==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c8b15 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=iTchkLz9Y-giF9P-svAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: gf-5jP1HoPY4XAvXdKsb0uBGrIX36yI6
X-Proofpoint-ORIG-GUID: gf-5jP1HoPY4XAvXdKsb0uBGrIX36yI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93743-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D4DF17AB0F
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
>
>
> On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> >> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>>>> Enable ADSP and CDSP on Glymur CRD board.
> >>>>>
> >>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>>>   1 file changed, 14 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> index 0899214465ac..0eed4faa8b07 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>>>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>>>           status = "okay";
> >>>>>   };
> >>>>>
> >>>>> +&remoteproc_adsp {
> >>>>> + firmware-name = "qcom/glymur/adsp.mbn",
> >>>>> +                 "qcom/glymur/adsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&remoteproc_cdsp {
> >>>>> + firmware-name = "qcom/glymur/cdsp.mbn",
> >>>>> +                 "qcom/glymur/cdsp_dtb.mbn";
> >>>>> +
> >>>>> + status = "okay";
> >>>>> +};
> >>>> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> >>> but the firmware in linux-firmware is (now) targeting IoT devices,
> >>> should we use WoA-like names for firmware on Glymur CRD instead
> >>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
> >>> CRD.
> >> I think it's simply time to stop pretending the firmware is generic
> >> (some fw simply isn't and some fw may come from different/incompatible
> >> branchpoints) and include a board name in the path
> > Well... CDSP is usually generic, except for WP vs non-WP.
>
> Hey Dmitry/Konrad,
>
> Thanks for taking time to review the series :)
>
> The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> functionality tested on Glymur WP CRD devices.  Given that the firmware
> has already landed, can I continue to use the same name as the patch and
> have a different name for other boards if something specific has to be
> pushed
> for IOT?

Thank you for a prompt reaction, it took just 20 days. During that
time we could have fixed WP firmware filenames, but... linux-firmware
got released just two days ago, so we can't fix that anymore. Now we
don't have any other option than to use a non-standard name for IoT
firmware when it comes later.

>
> -Sibi
>


-- 
With best wishes
Dmitry

