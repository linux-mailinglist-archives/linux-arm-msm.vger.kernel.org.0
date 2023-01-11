Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A831B66597F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjAKKyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbjAKKyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163FB270B
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673434396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wdMPDFYa0f6XjF6DYomIKbpIUsGfFZ+jIpGTyJ2mckk=;
        b=RaKia3qmTzsa6ybIpjVSswqEbNzfqVd7bFqxA77HQUZzxfaXLDK/OgSA/IBWNesuR4iMqu
        jUemY8j0cLjTRGBWl/7OVLVZQ4lvkTbXJX2kBTYV/lba4a8aBZRBwjo8YkA9n2RX225E7f
        n4WzuZBdvTLF0dP1IlEJhNdEJR8yivg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-MREUb1zmP_aKuREGHp2Trw-1; Wed, 11 Jan 2023 05:53:15 -0500
X-MC-Unique: MREUb1zmP_aKuREGHp2Trw-1
Received: by mail-io1-f70.google.com with SMTP id d24-20020a5d9bd8000000b006ee2ddf6d77so8751041ion.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdMPDFYa0f6XjF6DYomIKbpIUsGfFZ+jIpGTyJ2mckk=;
        b=VUNjcCkGIhU1vuo0vysnlxDECoVIgVCk+JNB72VJH61nWnnVUhRRqpbnnv89Sq1D6E
         QHdXbVorFI+ABqLfZc0us0tUbtVEtIazVCGKs8AV39ov5OxDFL7Qq74BWnfnZeT9B3N7
         SusgN3QF8g2F6yzDZtdIe4uZGTN0GMY/LiwIIsHlvGlbY0bTNBgBDColl4H4/XMGrUIM
         VN9Ei3hFlWgmvYbhPM8b/iGXOJ7AwSjIEfp5yxs/E+Mck0lJt0zH24DicshACtYG2lMW
         lIV4X4Rc2moYELw7//Kn+x6z0/PSMgchqsa/HE7kkQ28j8hJ4qqfoEBFtzWxt6IUfHQT
         fAdA==
X-Gm-Message-State: AFqh2koV3eWCHlh1CxR9QWET3ZdkZvzQsybHfFqBXS0fUp+RRNrb8B3Y
        bxfpoB8drA74HKIY45gHDxB6XUwl/iIMCuw7w2NOQ13uUYie4iTxJjLIUErLF+WbNNUUB0kPFcF
        Zrq7Q+U/qnfsECKhEFuZrcUOHBA==
X-Received: by 2002:a5e:dd08:0:b0:6e2:cfcf:f2cf with SMTP id t8-20020a5edd08000000b006e2cfcff2cfmr48656535iop.16.1673434393995;
        Wed, 11 Jan 2023 02:53:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEaFXbzyydyfCrHx57ew4eSAOphJ55zIPsm7jjLm0TZ2PS5N/LyFk5tDV6fmGuWU1msOsLdQ==
X-Received: by 2002:a5e:dd08:0:b0:6e2:cfcf:f2cf with SMTP id t8-20020a5edd08000000b006e2cfcff2cfmr48656526iop.16.1673434393809;
        Wed, 11 Jan 2023 02:53:13 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id b12-20020a056e02184c00b002faf6559e90sm4336528ilv.51.2023.01.11.02.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 02:53:13 -0800 (PST)
Date:   Wed, 11 Jan 2023 05:53:11 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Eric Chanudet <echanude@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8450p-pmics: rename pmic labels
Message-ID: <Y76VF1a3dM1sAfAG@x1>
References: <20230111082331.20641-1-johan+linaro@kernel.org>
 <20230111082331.20641-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111082331.20641-3-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 09:23:31AM +0100, Johan Hovold wrote:
> The SA8540P PMICs are named PMM8540. Rename the devicetree source labels
> to reflect this.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

