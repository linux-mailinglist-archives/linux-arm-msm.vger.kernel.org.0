Return-Path: <linux-arm-msm+bounces-116219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mN0HHxNzR2qCYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:30:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7F70010E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MvotkBA5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WYFKssT1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B508303C2B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCF8371897;
	Fri,  3 Jul 2026 08:14:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7D371D0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:14:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066483; cv=pass; b=G53MQN+y376E721uCTjcMe6+hrUrG8oH9aNElciWR6gmJVJxyNFF0hAoU1XF9S3z3LKvk1RfMfyYoBSQDje1fo8INdQq6W7h3OBMlrKYbrHlsT/ESeA6m6EqM98O8KNWBRGqm//dmoboUw6whAh+m2DzejMwJ/ew12iasV8vIPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066483; c=relaxed/simple;
	bh=DG3DBAzMZXCcZwMJjwpNQrEUC4y5CbZfP7CqYXPM65k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FouAwc7DgPtw+sbtOxFFr71smIgMiNb9FVJs1N0JWZSCWJh858KGuD3YS5gr5vSB3jxpIHXNDJn6dYtzA5+90TXld3QdAgRO02a/NXIdknErYyN41CMGg3lYffXzn6tJYWP/QKh/pr6n4grGXdBn4LfJhZd9QPPabsXZMlIsG0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvotkBA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYFKssT1; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rtJD3136392
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTiIe2AWI7dyCNsEc6sxfDRj/RtXLlxXxI5lpZ35yqU=; b=MvotkBA5JAzigAkW
	rBJB8JfRPnwBRCY4xzzwV0/R8SNO3T8kvLLQoPbqlZWoGSzt6WxcWgNe1sax3bG/
	jTc4o2wKAA+vS6hCiagwcdKj0cOwo7eI5QriXX1GdDwzDBW3DDLWcV7XBHCHvQWd
	WZlH3tfcEwwezQ/vMlIvbh+9xqw1Mm8e0yBoMY+UXD2Shpepw1v2cVrguTLYx7lK
	GEMreut7CawoM70vrb0jUqMjm+leWM7LDLxoKBm8E26wHCk/f58vHEjjB4m+vzJU
	7Ey1z1v4v/1ozIvXse1nwXV/tTG47qiVdPMsoiaMfh2zn9mI0xgfQL4Vi+EJuA4e
	2Dh6MQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b59byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:14:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso27085985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783066480; cv=none;
        d=google.com; s=arc-20260327;
        b=P43bIfk9hnRCC4GE0aXf4S7r3D7ZTExzqla5ox1ZKcd8tCyTFEitTLSVnAo0YmRhxo
         RZoNJHd+pzhV1er16F95CpAYACWydUK3OmCaLx7pZP7UGWnhIpn4Z6Yyk6JT9xlt47iG
         2ZKg+LVJNY8Bk8rxsb9SxAUT0qcRh57XrLkVD+4gTjNqAlUJoxGlh/OQWDy++gZt1mnH
         5vlQIUz4HZm70W7EHOSGtYOJbd1+smxatjxKXB40sFevHwKNBdalDVMf3ds1hL6fSlvK
         c/eKhjA0SSObpXwSfUBM7mBJHWTOQeduwyinj4bmkk5fHVZh5ZK7to9ehMl9lOWvJtTt
         mRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTiIe2AWI7dyCNsEc6sxfDRj/RtXLlxXxI5lpZ35yqU=;
        fh=PVQ+dzDAIzTUw4RnkgVIFbjFWXuqJXf2mIoajzXbh7I=;
        b=XIYYdsiSrERX6PK7diaMmrvzD1CI2WTtvRpTu4+ZZj9N/ZFUAcjiDtUDp9pkUmXfxn
         YyZrV8Kyn5KTOaoeiZOQltlNIbFwyTz5Wef7q3RFMwY1lNYD5iNGTyBQQEwc3WrxITzL
         E5onnfkwqyHN+phe2+mfNtZ/WRuhOgTPhz2LCs/hjYOk7ov+dkwZSYmxwC8Xom49Q7Ix
         dNwTksRgZCwLDGMF6s8xwEfQpLFpkoXiY09cNXHpl9PeChont/tHFIVcL8DTzisiIQfd
         /61ifAZvW+xakBY17yeR2XFmkFku4ghI7Pp+9hx6okAyyjmzJm4qxuV4YOtmKXOQ8lRr
         uOlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066480; x=1783671280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTiIe2AWI7dyCNsEc6sxfDRj/RtXLlxXxI5lpZ35yqU=;
        b=WYFKssT1IrQc4VXF9ILkqrIjuZDhKkBdU+mEGpXtiRpJ0UkEj7Vi5lfCFRxGrxPyYd
         QqVbst9V2grNMOuj8Ps05G5POE/F+VYPAsUnJOQfkdZaiT1jAWQDszrUlm0aYXxOt1rL
         hPZJCvJXa6Y/XlFzsl/N1PkYTTGUpLzBv7KCPO6wifnLKbSkGL4rbPO1HdSE5ZWPMYQ9
         imnLa0Bo7OacBI5rgzaftUwXDe/3fBTiGE6SJIRxYaZNwFbALnuC9m1FtwMZ+DdAJW2K
         z9PMA03vpPZjX3No3Gsy4zU7dK6bNTRtv/02+XyRRmiRdEVy8EmhFztPZFVxFiMKBUcH
         MxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066480; x=1783671280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTiIe2AWI7dyCNsEc6sxfDRj/RtXLlxXxI5lpZ35yqU=;
        b=Wth3hrEE9T+6OfFaMjD5BXLDrnLmTJ7P0WrumiFgc78eT88zJgNqtT303Xg3DBvUCt
         lC88CzQjTKUHhD3YPBb6T1zWTFoVCdkgmt8fIzB/QImFCien5ZW8tPso/5OStcy7TASm
         dTm34Mq7f8zgCaq40G7F4MmHIQMiVoDS85hSX1bDisSeR8g2+A34auPtgiin4W3wT3nf
         XaU6LUUTHXvTpEOLAP3ZNhr4iBjs4ZYzMgVOVCu2by5hTMqOvK0NNErT0P1Ev1YUsO0Z
         KoOn5cDflttXUNXTZWYXbfVGd7hEI2mJmimWr3DnBU8CnlCQ05BJope3X3uFqObMxKo9
         AGDA==
X-Forwarded-Encrypted: i=1; AFNElJ9HrDNmvm+0c70vCwOtc3/773+SQtZkmK0eFk+HKg0f8k+yvNIxdLh+ua+fWn4BnOM4xTcHTOhXeLyuYw0M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63HSHDN+L3tzUgqBViK68eiY1BLzXicJvZ+XtDmb3sFu2YtA1
	Ce9sFCpOewUsYORz2Ke8+9bG6/ufnFwSKWVuajwxp4K0Shd2r83UZeBqUJvc9qkBfbdLEmxEbFr
	f9uRigOFPKa9q7HfsyN1JY5GrVIzGX970m+SVfVP49X90XUoZDt1znfiDA9Lps9wiFaYQk0+9kc
	6jj557FoZ4a9LlKCyP9a1ZEF6CTIen0hArA+CTFvWDLnw=
X-Gm-Gg: AfdE7cmNv7iGkOzw1VFh+TyTfOb0OoKtGcAaB9ir8eR5RqwtjFrMjFhWRmHAApRjYyw
	Y6T9s2FmsHneYyi9F8Gz+Dr8FJWnTE4p+sjdfXLrWmPYGZOpBfcdq2HWRGIoLoqStELT9xqndCh
	gC6MzzjS186DmCSah2dHpV3x3SyZnecmfhYhHoq9eCRE+ojAdX70KtzpXe+2oZDf4zv8oyZKKiH
	OikSmdwOaUqLvmwuvSmlI0MetCkCTiltL144NsuVNisjwdzpfnONaOOapqGJnWS+xPGR4WQ5exC
	V1Gvqm0bbg==
X-Received: by 2002:a05:620a:258a:b0:915:9229:4223 with SMTP id af79cd13be357-92e78506543mr1251475985a.58.1783066479664;
        Fri, 03 Jul 2026 01:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:258a:b0:915:9229:4223 with SMTP id
 af79cd13be357-92e78506543mr1251472685a.58.1783066479187; Fri, 03 Jul 2026
 01:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
 <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r> <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
In-Reply-To: <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:14:27 +0200
X-Gm-Features: AVVi8CexGaHIFoFTXJdV0YYDv7J6g3Xnp1ITKoqBI9DhryS5xqq6T1BctXtOEr0
Message-ID: <CAFEp6-2y9uZc79WSTeUYoNb=y16RGtkk6P1sAqour9hR05dNCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3NyBTYWx0ZWRfX1X2rFqRyA0/F
 +4wWU97KDOOfTwgzSk1+MmG/TGL5/Xmoxe0zY98ycAzN+MW4ni1s4uZ8OiWwHivpLXde4PyyQC3
 NKGy6RIzCg0cR8fSxSUT9aawkJVfVMs=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a476f70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jXReHmxAYlc0otBLIJEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 93IpLrLlOREXK4Eit2sZkg_37UDMDp7q
X-Proofpoint-GUID: 93IpLrLlOREXK4Eit2sZkg_37UDMDp7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3NyBTYWx0ZWRfXwB/G9sgriJLD
 pmPF6u52VT38XlZBK4GTMJc0vYc1IIhEGijX07OFsM2Bs3cnn/tJY6SO4fJ6ZzmnLCBSpFIM7T5
 SCYL1l/HRTr5O0IQYzTxRM9qwXFdzCFNZxulaiUlPt8ZwvLZ8TZfrWQ7oVZZ2+s6GXCDEo6SgYJ
 zhmKLB4KxErd+SX8dvmxUrguYmuEY/0lBizl73or6yaCEcGKxu3h9u0WZVb9nE9cBDo1aZ16Fd0
 /nxKopliCA9Fg6d3gLiRD8SmyeXARxuP7Oq6HZsYCHo//o0cU4bKp8zxjOcSJUZm6lq02Dz15PT
 VDaks3z+fV6paXCNLeEpOhwcfUexWtx9BPSS54GwlwDyFXqb5zBnpyKGTWVZ6LjN8v4GdFr5MjX
 xa9Ogf3tCNp1U4zvbXe1EtssJKgmhLPLXwUoVaLaoqW2t2PfMKp8jdAVHhNIGKeM9haGADeqKnx
 obHCSxbuhFYBr5Cda4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116219-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4F7F70010E

On Thu, Jul 2, 2026 at 5:09=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:34:31PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> > > > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART ena=
ble
> > > > > is controlled by the W_DISABLE2# signal managed by the pcie-m2 po=
wer
> > > > > sequencer rather than a dedicated BT enable GPIO.
> > > > >
> > > > > When the serdev controller has an OF graph (indicating it is conn=
ected
> > > > > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > > > > connector's power sequencer and use it to control BT power instea=
d of
> > > > > the bt-enable GPIO.
> > > > >
> > > > > Also allocate bt_power unconditionally for all SOC types since th=
e
> > > >
> > > > Can we just fold it into the main struct?

Yes.

> > > >
> > > > > pwrseq path is independent of the SOC type switch.
> > > > >
> > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++-------=
--------------
> > > > >  1 file changed, 43 insertions(+), 38 deletions(-)
> > > > >
> > > > > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_=
qca.c
> > > > > index e09debdb00a1b8e74ccd5de6147e240e533b4594..b04593a96e14ac9e8=
7ae76fa00eda308e81dea25 100644
> > > > > --- a/drivers/bluetooth/hci_qca.c
> > > > > +++ b/drivers/bluetooth/hci_qca.c
> > > > > @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hde=
v)
> > > > >                         /* Controller needs time to bootup. */
> > > > >                         msleep(150);
> > > > >                 }
> > > > > +
> > > > > +               if (qcadev->bt_power->pwrseq)
> > > > > +                       pwrseq_power_on(qcadev->bt_power->pwrseq)=
;
> > > > >         }
> > > > >
> > > > >         clear_bit(QCA_BT_OFF, &qca->flags);
> > > > > @@ -2256,7 +2259,7 @@ static void qca_power_off(struct hci_uart *=
hu)
> > > > >                 break;
> > > > >         }
> > > > >
> > > > > -       if (power && power->pwrseq) {
> > > > > +       if (power->pwrseq) {
> > > > >                 pwrseq_power_off(power->pwrseq);
> > > > >                 set_bit(QCA_BT_OFF, &qca->flags);
> > > > >                 return;
> > > > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct qca_=
power *qca,
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > +/*
> > > > > + * Acquire the M.2 connector power sequencer.
> > > > > + *
> > > > > + * An OF graph link on the serdev controller is only present whe=
n the BT
> > > > > + * device is attached through an M.2 Key E connector. In that ca=
se the UART
> > > > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power sequencer=
 instead of a
> > > > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq target fr=
om it.
> > > > > + *
> > > > > + * Returns 0 if no M.2 connector is present (nothing to do), a n=
egative errno
> > > > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq populated=
.
> > > > > + */
> > > > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev, b=
ool *bt_en_available)
> > > > > +{
> > > > > +       struct serdev_device *serdev =3D qcadev->serdev_hu.serdev=
;
> > > > > +       struct device *dev;
> > > > > +
> > > > > +       if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev))=
)
> > > > > +               return 0;
> > > > > +
> > > > > +       qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&serdev->ctr=
l->dev, "uart");
> > > > > +       if (IS_ERR(qcadev->bt_power->pwrseq))
> > > > > +               return PTR_ERR(qcadev->bt_power->pwrseq);
> > > > > +
> > > > > +       dev =3D pwrseq_to_device(qcadev->bt_power->pwrseq);
> > > > > +       *bt_en_available =3D device_property_present(dev, "w-disa=
ble2-gpios");
> > > >
> > > > I think here you are looking into the exact details of the other of=
 the
> > > > graph. There might be other devices on that side, while the code no=
w
> > > > assumes M.2. Or, consider having an M.2 controller which handles
> > > > W_DISABLE2# internally rather than through the GPIO.
> > > >
> > >
> > > This code only deals with M.2 connector in specific, so I'm not sure =
why we need
> > > to worry about *other* kind of devices. Let's worry about them when t=
hey show up
> > > (with graph interface ofc).
> >
> > I don't think we want to go through the drivers using M.2 connectors in
> > such a case. In the end, the contract should be that there is a power
> > sequencer on the other side of the graph, but the specifics of the
> > connector should be abstracted out. Do you know, if in the x86 world th=
e
> > W_DISABLE2# is a GPIO or is controleed by the hub.
> >
>
> I tried to abstract out, but Bartosz didn't want pwrctrl APIs to do that =
level
> of abstraction as pwrctrl APIs should be generic and should not be bind t=
o a
> specific connector and exposing its internals.
>
> That's why we ended up having pwrctrl core exposing the 'struct dev' usin=
g
> pwrseq_to_device() and letting the consumer extracting whatever informati=
on it
> needs.

Well, I'm not a fan of this solution either. I think we could imagine
a generic pwrseq_target_provides_enable() helper to query whether a
specific target (here uart/BT) is autonomously controllable, instead
of peeking at w-disable2-gpios. But that's significant work I'd rather
discuss and address in a separate series: it needs a new capability in
the pwrseq framework and changes in the pcie-m2 provider, since today
the uart enable callback is registered whether or not the GPIO is
present.

Regards,
Loic

