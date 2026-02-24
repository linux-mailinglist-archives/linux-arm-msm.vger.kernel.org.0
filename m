Return-Path: <linux-arm-msm+bounces-93988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG03EJqfnWnwQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:54:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60618744E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37F2030A75C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D6D39A818;
	Tue, 24 Feb 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5JxUtrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqPikd77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD3E555
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937534; cv=none; b=bv1oZCGQnqxzQiDtGwHhmn9yV5u/6aPNk1etXix8E6gWp243STRh7ZaI6QJnBxCZdOuuCpIoGmbLK1DQ0PIgA3VzsGp59Ui8Orh8I/qZD/acf/bFKWT+KNRZ8FeYuJgZJoaz7jT2CimAcEcJ/XrjTi//vNe9NolsQ8TJKccmias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937534; c=relaxed/simple;
	bh=e0fsvBudio5HxLSOZQn3Lec8MEFgfZUG6+VnErYT7Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tojRtLnr7QU9cL5gpiXpd7frnMLzm22TMSvYmbkbLKwLkxYTYpZHGdCX/Je4t9K8tUQjV/6EiYmhW8UJt09O3s8eeYUWy3q9sfI9Yli1vNkOyfbgQZaAwPvWg/IkZZwrP/GbG0XDShs6ixt+fHz/jV5NHOI+WgmAulqZOHnAl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5JxUtrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqPikd77; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFV9F2220897
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wXaaTE0K44G/RbHIlQ72sYS58NboIdqrv/MSBFut+8=; b=c5JxUtrVcZEDo9ID
	D5H2A1zsOq6PZk7Ug+kb5p7ROmb0FJ4NRyxf0RPvP46w5cYV1AxcIrS8GG4Qc1ys
	S+qyyAF1eIcMSTJivZ9byI0FOk6gUj26cykCJIQLQJFUj98FIWdcVEphYPGSF4nm
	7D26hogcZFafj2RZHapmFmGjRQEmTaWNbKHvN9tyIZgjs6HIN/7vs6Mk45ZAmT4s
	nZwa8zt0kPzZhZYQuSOMfq8UWrQwaZgZYmJzLD5uJzw3xraE2j+dU9JUDT0Gxn6e
	qaRyi7dvf1KlZFHDwZ9mIvprbkyMn7yfmAUB6uDn4eqR0l4HSGnURKoEPnKh6wd+
	xAnknw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39fv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:52:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so607367985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771937531; x=1772542331; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wXaaTE0K44G/RbHIlQ72sYS58NboIdqrv/MSBFut+8=;
        b=UqPikd77mEgUDF8Bp5MxMRCR5Y1o6vGVnZuYJoYYmPQz8LBvZEA9ldLHi063r/9dmn
         wMul0W/7gWwd3TH5yykb/ylUdLdI5feUkJ9LLdvSHtXyOunTzXCViCu7zBnstNJI6MUV
         VFLoWB5lk0jy4tnwT05OXYXkSnpQR3gubxb43MyqZZUHuYG0g97OMzJDxWkCIGbMbKoA
         nRYZTLzqNFHL10WbaxtPES8IfwG+8Zo4wUav73ITvIBYyYLnehOdKb7pguXi5RZ/vCDH
         oLlydco8ppZW8s7bINo4Spn4oLb6KJTlJHLfb/lKppXfbO1gSv3y1yWfKas39SuSJooO
         BV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771937531; x=1772542331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wXaaTE0K44G/RbHIlQ72sYS58NboIdqrv/MSBFut+8=;
        b=T0CluGCcc/mmHscO8BjUoSma5CVabeFtlZxfbuYRWNGyddG5rqOKEeK1ADVOsqY17w
         qS9Rg6Wk1T7hdO2UalOcuii1z2K940jiItuM3hdfPcTk0HR+/OEaGiH7TqSRhN/gLQM6
         pcGQnY93nsWn3umGfbr4aSwPztXNUBKLTJz3CXKIb5D+GZDtrJEZx6OnZgF92fSdlSEI
         ogOKzAb1Z3X0z2qmZhlBOzAKC6wIAs8/NrgvL5DmChSLGGvXo6YsuZW//zT/pjNNELcL
         u3M8AEDH0BRL9VhL7XRoiQWvsQEhWwvmafpE+R6UFpGRvmSjbavZwNns0Nbc8juVUi0H
         WBLA==
X-Forwarded-Encrypted: i=1; AJvYcCXoRYxwCHrhuvSedt0WBaLbDX55AZCHCuQj4eVEjih+CsxKaW5Ki6ThGIBNNuD65yalgm82CB4anlmyzeVD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01fLX7XHVxrqItaInrIXxUO3CStz9RQqZf0NCog0F4y5cwjiW
	WiqXx5l1UmNkXLqaPR1J6uARZT/twadbHvGXbjLhVi1ThEjQvjzc/vOF+DvQMVMZfWcgClT1vXD
	IXFej0N8iyY+LJO5miYju81w7nRXtYC4ujkmR2FZvGdOCj0W8xNCFkkTggU+GJM3Omzxj
X-Gm-Gg: AZuq6aLLH9aF5AhbCttUab8JSFoCWz7OPgBSAVLELyql4y6mBu/buzCHjN/m0nBaOGm
	Wb8Of2vKCRg6aStv56dVYcEboPYvzXxGdTLZtmjj7R/k8OQC1q3wwLEzYNWlmk0YviUyKo2Flns
	XyzOXybdK9zeCUc8qYlui/jvmrAzABT1NVGVggNO3LT6IjERsOkH1X7g2uFFqZZZCuZXqAjCEPo
	mToQ5eCXyRjquyyPvuokVfnlAH2nPiPWMjJNfTE+NLxgvV7W+BVPowNLoAi4i+/VmtLLW91XUr5
	ASzv4x1TM8tSTCtbPB48J5wIqXG3DU1m2ZtUQzGRH/CU3Ldq5FwcEGXu+AQ+UX6kSAWzcX8fzGA
	pr/oJVWxCE7OH6cK9ubX/sk1ExZ7hHtYDNUxUJ/ymoPcadjiKltofuQnOm2BsS1zOtIz/1wYj+4
	GQ0jsOqpaIczzuOfiyArkcUhz31Fdq1Ynvbao=
X-Received: by 2002:a05:620a:1aa6:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8cb8ca89d86mr1550574985a.70.1771937530621;
        Tue, 24 Feb 2026 04:52:10 -0800 (PST)
X-Received: by 2002:a05:620a:1aa6:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8cb8ca89d86mr1550571685a.70.1771937530095;
        Tue, 24 Feb 2026 04:52:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b8f0sm2143851e87.14.2026.02.24.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:52:09 -0800 (PST)
Date: Tue, 24 Feb 2026 14:52:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, mani@kernel.org, casey.connolly@linaro.org,
        amit.kucheria@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
Message-ID: <wuwwacgunqbtjcgj3ai3bznewc3ejijve7wjonen2j2kgsokse@v4uchehtz6sf>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d9efb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lDahQbM-NyokND_-sVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ITICvj6WbpgxWY45HFDW7hTcXSH_Ipu7
X-Proofpoint-ORIG-GUID: ITICvj6WbpgxWY45HFDW7hTcXSH_Ipu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNCBTYWx0ZWRfX5f+yDAAyWSql
 J4jtS3ak3OJq5O0kk22l/p1OQd2HFl6TGQEFbOowUli16bGi4ENyd/ivh8tsNTqkIg2fprOrVrJ
 v1uZKiiB+OfhgegyCuVqa3YYHFZ+Xk/G5EAOV1CAcpzOeovNYqj5zfFxlcY4n7B06Ab5hVJaVLp
 IbTGTCm+ki9anTvLU1/vIVnwGr1KVADEuiDFFUURtXsSJWC8yOW8OE6tz703NnjYditB4jfx4pD
 dNdAa7hyhwlBIdh14rUYr+hMWzX795Z6Mnx/Yk3KDLQo6/KX2DxRgMYiJQ1JecILEkUAR7PdJsE
 KenejOi02UCGQeRdyNJSvQJCShW9lVHWq34HOFsCYsu74UfdC/pp4KbVNKw5qToLo29ESsp2Vcq
 FGTca1VxMW5yVvy2gXpVzULWf7etOQWyJci7V2/N6rq249930q5lhJw9gFjnROiZbmqEROhMAZv
 Nt3Nx3eOkWZMmnEgCPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE60618744E
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:39:42PM +0530, Gaurav Kohli wrote:
> 
> 
> On 2/20/2026 1:14 PM, Krzysztof Kozlowski wrote:
> > On 20/02/2026 08:29, Gaurav Kohli wrote:
> > > 
> > > 
> > > On 2/11/2026 1:43 PM, Krzysztof Kozlowski wrote:
> > > > On 11/02/2026 08:37, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 2/8/2026 3:36 PM, Krzysztof Kozlowski wrote:
> > > > > > On 29/01/2026 13:06, Gaurav Kohli wrote:
> > > > > > > 
> > > > > > > On 1/28/2026 4:57 PM, Krzysztof Kozlowski wrote:
> > > > > > > > On Tue, Jan 27, 2026 at 09:27:16PM +0530, Gaurav Kohli wrote:
> > > > > > > > > The cooling subnode of a remoteproc represents a client of the Thermal
> > > > > > > > > Mitigation Device QMI service running on it. Each subnode of the cooling
> > > > > > > > > node represents a single control exposed by the service.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > > > > > > > ---
> > > > > > > > >      .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
> > > > > > > > >      .../bindings/thermal/qcom,qmi-cooling.yaml    | 72 +++++++++++++++++++
> > > > > > > > >      2 files changed, 78 insertions(+)
> > > > > > > > >      create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
> > > > > > > > > 
> > > > > > > > > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > > > > > > > > index 68c17bf18987..6a736161d5ae 100644
> > > > > > > > > --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > > > > > > > > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > > > > > > > > @@ -80,6 +80,12 @@ properties:
> > > > > > > > >            and devices related to the ADSP.
> > > > > > > > >          unevaluatedProperties: false
> > > > > > > > > +  cooling:
> > > > > > > > > +    $ref: /schemas/thermal/qcom,qmi-cooling.yaml#
> > > > > > > > > +    description:
> > > > > > > > > +      Cooling subnode which represents the cooling devices exposed by the Modem.
> > > > > > > > I do not see the reason why you need 3 (!!!) children here. Everything
> > > > > > > > should be folded here.
> > > > > > > 
> > > > > > > 
> > > > > > > Thanks Krzysztof for review.
> > > > > > > 
> > > > > > > Each subsystem may support multiple thermal mitigation devices through
> > > > > > > remote TMD service.
> > > > > > > 
> > > > > > > Because of this multiplicity, introduced separate binding file.
> > > > > > 
> > > > > > This explains nothing. Subsystem does not matter for the binding. My
> > > > > > comment stays.
> > > > > > 
> > > > > 
> > > > > thanks for this suggestion, we will use qcom,pas-common.yaml to define
> > > > > bindings and avoid creating new file.
> > > > 
> > > > I asked not to create any children nodes.
> > > > 
> > > 
> > > We have multiple cores within a subsystem(cdsp) and each core has its
> > > own independent DCVS. And also we have dedicated TSENS sensor placed on
> > > each core within the subsystem.
> > 
> > Your own example in this patch had only one device, so how do you
> > imagine to convince us with incomplete or half baked code?
> > 
> 
> Target of this series supports one tmd per remoteproc, due to which we have
> not posted examples of multiple tmd. Can i use dt binding example sections
> to describe all tmd's per remoteproc?

I think you have spent more time arguing that you this series is limited
to CDSP than would have been spent on adding ADSP/ SLPI / MDSP support.

> 
> > > As a result, each core requires its own cooling device, which must be
> > > linked to its TSENS thermal zone. Because of this, we introduced
> > > multiple child nodes—one for each cooling device.
> > 
> > So you have one device with cooling cells=1+2, no?
> > 
> 
> This will be a bigger framework change which is not supported, i can see
> other drivers are also using something like this multiple cooling device
> under device node, below are few examples :
> 
> ->Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>   In this multiple fan child nodes are present.
> 
> -> Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
>   In this multiple child nodes are present, like heavy and light.
> 
> Please suggest if our current approach is fine or you want us to implement
> in some other way.
> 
> > > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

