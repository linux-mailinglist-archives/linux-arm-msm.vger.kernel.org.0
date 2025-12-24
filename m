Return-Path: <linux-arm-msm+bounces-86480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC543CDB77C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 804BF300954A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7622D1F7E;
	Wed, 24 Dec 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RbncKnbc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHhBDZvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9A17A2E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557252; cv=none; b=idP34T7Cyu+m8m5IFLZWa0oYraMUyRx9vhGsp/+DT+UgqKwWdmLIm/7hluUDT6DN61ZTpfz+f4m2JBIToqcV4HEd/Er3vQCIQRau7TDTYfLUw8vCDLTdyUF1K8QnNGOVoEIdiR95B7wZTR0TZic0CdKpfEsE6SNnLPXfBGKdLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557252; c=relaxed/simple;
	bh=YEu0N6mtsX+78cD/CmPzoRJXQWcn88nSaLemCI2Qcz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCwmzP5zAV52aRRpDFrhCiBgXxhvXjbPtfXC3e2QSSwgYeKgcn0R90OT7QyFGoWvlOLA1isdl36TOzdDPRsqP2pvMmWwBBgsI/9XFqmwk+UYW7Ih9K3RJH/mrFMsWbVLHhmZCbJDPMMkhVo92pIvrzuSAi4Lr4/dTCB3611rXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RbncKnbc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHhBDZvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHtLwD682292
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ud2Hux0xDTUlgWj08/z4AcHL
	iSpvn9bJIK3RFYzsRn4=; b=RbncKnbcKlTMI/eDjblTwS0S2SaV2ls4OZhu2/db
	2h4Pz4jI+1AV4ZEoH9TNcbs3wD4SlJflg0xiijJivMm1zz4iAMWL9D9pmibguGO9
	5TDCh7b4ZL1N4XNApWl6bLo4BDtvsh6ArnQUZGQ/owaI+iWTicrUrt4dq1M+j/kj
	rWUZfc/bV5mNGo2t5eFc2k/VUh7QMskdoR0YXnGxaUnsjxxn7oChcyiGNQ1mBIrZ
	ExdooQqK6FTzmJYhx7TANjaxl/jxLgtB2drAVco80sKY5AAkFx0Eon0b2mT9an2L
	F3ugiHbLSsvhoOgV8C3YGAYKBEv7uBroUW2FkxoEiM+NhQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq1r22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:20:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso5608861a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557250; x=1767162050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ud2Hux0xDTUlgWj08/z4AcHLiSpvn9bJIK3RFYzsRn4=;
        b=XHhBDZvl6kjXP8rs8hqZj0GWDFsFtbskso55dFY6w4WW/sM8a6JNZ2g+G+fpYKE/gw
         XZts9TQTYSfK6kZBvixap9xQkN+oNFx+tepIFta/HIxpI+q8pa3RMgPHEuKY1tNSP7VP
         THSHxEwni9qXrA0TwO3RxRMAZJshhfOVrmUA61Jo1YSj8G7Tv1ZZ0bhX7tX17wMj5E5Y
         IhSHz9JTTqHhHl3g0Uad8isSSalr0fWJWuYgn1ewqQqEbQGZ/+1jw2aYmaKD4szgq8mp
         A+gi43AVGpPpezWcBnI7ueVygz+5+9aJ62zqkrD7moHX06TFcLrve+o0K5RsnkhyFSyX
         xECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557250; x=1767162050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ud2Hux0xDTUlgWj08/z4AcHLiSpvn9bJIK3RFYzsRn4=;
        b=UYgDb35cuHEshGlSFxRRnOHoAoiUSTWXhS+KRsDe2R3XISAVxFD8zDsSzI9IKl1fV2
         RcXlVrqp05KIM/uYqkzWyxGoYfw9ysOYzhNFKZPzYtCykgo/oVRVLPO7/g9H3mfsIPmH
         gE4r8VPdxdZbV6cOCW1lOLDvdb/ays3iD7S+katgZhQKSRQfZIQHVWRB8xIl0qZEY867
         jmHf1U0icJgdt6A+jW/yPX0lXWksHrQKvZhjyk8ybwUFC2MHLEDi0dAKURzW+sGfyzHk
         bvGPuRBwqGYYmltHXoWPkBHwwlEYXAz9AmOfbbIIiYEi66EFJvCXa43B2N2zGAhvoCm8
         l1Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUr1ccRWtTmmSfZc3c5ue3LpBpxdlMW/VaX03AsXVNpyAbeJm8UyWF+T8sz3Yf12LkZV2wqsv/0yZ5dqYKY@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCr2/Q5Czz5xz7ZrXcI3AUw9d4B0uCCMCV5V+9fBZd/v0JaKF
	3ZwikQCAcA6jtpBfc47CZt/VtNi7LKnzOmTZjlSQ3qxX9Sc5NuvvgRRBipbwOqcOcf6Sin/9WC5
	VHzNCYHUwShOFibc4r7jEoju7q2gVi80xpwQSxLt2i7YOX/3EnluwY+3HsHa+9d1akvq1
X-Gm-Gg: AY/fxX5oUMGpwtbd+bdt8PE6Dj9iByz1ys8sLxreb4bZGtFTLj9iRGYKd6DC5fR8eie
	VMqqwGxkiR4owJ1/c+DPiRguxedPVz7TJpBOYTMnXsQbUBMV7XZedMB9B2HcSIqBu7ujldV38nZ
	0g7v4zUMaij0MtyVplDkLR9ZL81sHWuYI6VguBbqnpndk386e9+JBxKb3mzZOdDbVIbT3Lwamr1
	s3DsjoLAofzBXVY3ky+c08AFxKG1klc9TV98qoiFzXvbnnOPXuhIC567/4djcltbuXUfJHRwztm
	RcMSI1Ea8+43e3Bhon6pnrRuwNQ/7FUDyg8k/drJzCJjpllnwL9RK5Jk/uihTwRHh31lwBPgv5C
	vecHrZ1jaXGeHqobtu7TIuXft+NfbTaQI52fN5Vl7Vg63xHUICK0xDjby
X-Received: by 2002:a05:693c:809a:b0:2ae:5f34:e93f with SMTP id 5a478bee46e88-2b05ebd0b12mr16934096eec.15.1766557249880;
        Tue, 23 Dec 2025 22:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGazPArtUoNJjmrUNLWEIyeTwzXqVQN3BUYwynjWKWeSW5YA90q+PzXzxtaqjuA8VNcdGa/UA==
X-Received: by 2002:a05:693c:809a:b0:2ae:5f34:e93f with SMTP id 5a478bee46e88-2b05ebd0b12mr16934078eec.15.1766557249293;
        Tue, 23 Dec 2025 22:20:49 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm47567444eec.2.2025.12.23.22.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:20:48 -0800 (PST)
Date: Tue, 23 Dec 2025 22:20:47 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] PCI: dwc: Add new APIs to remove standard and
 extended Capability
Message-ID: <aUuGPw0Ml+BvDL+z@hu-qianyu-lv.qualcomm.com>
References: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
 <20251109-remove_cap-v1-2-2208f46f4dc2@oss.qualcomm.com>
 <aUpDqu8598J4yNHb@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUpDqu8598J4yNHb@ryzen>
X-Proofpoint-ORIG-GUID: GVW2mQDgQES2rxCqhbBQZ6PVmE2h9lIF
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b8642 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=keqCWTWlQfiW9DbH:21 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=grQ0gQtqvyRId-AEQfsA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: GVW2mQDgQES2rxCqhbBQZ6PVmE2h9lIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MiBTYWx0ZWRfXwWUzPzNUM1yx
 rtT5xDw8E3IWWsOqnK+KQlLueA6nz38RDWHo4QD24odNwBmZR7+Ym/Bkvk3fkDIeI9ZnYu362XK
 Ch3eG51IltxZ3EyZj58RPytVWk9aoBUw26L266+cpQiUS5sSal3vAzSkbatshuWAFHLANyQsXgL
 32DzT4ovI7G2r0apSO7VLfX0I0MlW7jB+bvqbvy3tIVEncvRQU/adK3xy8lHu/Jwtmb20Yz+qHG
 KhGKifQMYkanM5XY1cNbZ5n9nY/w9UNss83Z5VDldjthcsXdAlQkNtH7DPuZYdu+hMdpAzcrGOV
 svPkQnVmTfpRsGPZ8F2cmJbGmJqBXFNLWJItkHf2dX0ZfyyKwrXkoeHvflC6AmRih9/j6lZiOe0
 J+g9EuWnxaTqjjULO+6s1JL6+86oDrsqO26oJinOzX7z/+wKsSe3Sdjq1JdcDAJ93xG56SdZ07d
 6wwiZxvQJkZH7rENElQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240052

On Tue, Dec 23, 2025 at 08:24:26AM +0100, Niklas Cassel wrote:
> Hello Qiang Yu,
> 
> I just saw that this patch was queued up.
> 
> dw_pcie_remove_ext_capability() basically seems to be identical to:
> dw_pcie_ep_hide_ext_capability(), only that your new function does
> not require previous cap as an argument (so it seems better).
> 
> It seems a bit silly to have two functions that do the same thing,
> perhaps you can send a patch that removes dw_pcie_ep_hide_ext_capability()
> and updates the only user of that function to use your new function?
> 
> Sorry for not seeing this earlier.
>
Hi Niklas

Thank you for the comments. I'd be happy to send a follow-up patch to 
resolve this.

- Qiang Yu
> 
> Kind regards,
> Niklas
> 
> On Sun, Nov 09, 2025 at 10:59:41PM -0800, Qiang Yu wrote:
> > On some platforms, certain PCIe Capabilities may be present in hardware
> > but are not fully implemented as defined in PCIe spec. These incomplete
> > capabilities should be hidden from the PCI framework to prevent unexpected
> > behavior.
> > 
> > Introduce two APIs to remove a specific PCIe Capability and Extended
> > Capability by updating the previous capability's next offset field to skip
> > over the unwanted capability. These APIs allow RC drivers to easily hide
> > unsupported or partially implemented capabilities from software.
> > 
> > Co-developed-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 53 ++++++++++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-designware.h |  2 ++
> >  2 files changed, 55 insertions(+)

